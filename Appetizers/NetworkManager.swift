//
//  NetworkManager.swift
//  Appetizers
//
//  Created by robin tetley on 20/09/2023.
//

import UIKit

final class NetworkManager {
    //this is a singleton meaning we do NetworkManager.shared to access this
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    
    //once this has completed the Result will either have a succes case (Array pf Appetizers) or a failure case (Error)
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        //check the url works, need guard since url from string returns an optional
        guard let url = URL(string: appetizerURL) else {
            //counldn't create a url from string
            completed(.failure(.invalidURL))
            return
        }
        //a data task to download the information
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            //if error has a value fire off the failure case and pass .unableToComplete. originally he had guard let _ = error else. guard let is more like 'make sure it has a value else (if it's nil) run the curly braces. Therefore it was running that every time it found error was nil. With if let it is 'if it has a value run the curly braces.' We use _ since we never use it.
            if let _ = error {
                completed(.failure(.unableToComplete))
                //these returns are here because if any of these have nil we don't want to run the rest of the code.
                return
            }
            //200 = things went well status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                //if response has a value and it is not 200:
                completed(.failure(.invalidResponse))
                return
            }
            // check data has something in it
            guard let data = data else  {
                completed(.failure(.invalidData))
                return
            }
            
            //if we passed all the above checks now we have our data and we can parse:
            do {
                let decoder = JSONDecoder()
                //what type are we decoding and from where?
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                //the success case is in the signature of this function Result<[Appetizer], it gets passed back as a closure into that let request: [Appetizer] array.
                completed(.success(decodedResponse.request))
            } catch {
                //we've got data but can't decode correctly
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    //used in the ImageLoader class in RemoteImage
    func downloadImage(fromURLString urlString: String, completed: @escaping(UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        //if we've got the image in the cache already, send it back and done.
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        //if we checked the cache and get nil we continue on below.
        //checking the url initialisation of the string which can retun nil itself
        guard let url = URL(string: urlString) else {
            //show the placeholder images
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            //check we have good data and also try to init an image from that data. When you init a UIImage from data that can also return nil, hence us unwrapping this.
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            //we now have our image, let's put it in the cache so we don't have to download it again.
            self.cache.setObject(image, forKey: cacheKey)
            //send the image back
            completed(image)
            
        }
        
        task.resume()
    }
    
}
