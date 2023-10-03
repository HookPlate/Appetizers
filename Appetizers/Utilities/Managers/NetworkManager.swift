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
    
    
    //much cleaner handling errors this way..
    func getAppetizers() async throws -> [Appetizer] {
        //just unwraping our URL to make sure we have a good one.
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        //because this is marked try and await, if it fails it will simply throw an error. This returns a tuple of a data and response that aren't optional. The reason we just use _ for the response it because we're not bothered about handling individual errors as before. 
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            //what type are we decoding and from where?
            return try decoder.decode(AppetizerResponse.self, from: data).request
            
        } catch {
            //if the decoding fails we'll throw this:
            throw APError.invalidData
        }
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
    

    

