//
//  NetworkManager.swift
//  Appetizers
//
//  Created by robin tetley on 20/09/2023.
//

import Foundation

final class NetworkManager {
    //this is a singleton meaning we do NetworkManager.shared to access this
    static let shared = NetworkManager()
    
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
            //if error is nil fire off the failure case and pass .unableToComplete
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                //these returns are here because if any of these have nil we don't want to run the rest of the code.
                return
            }
            //200 = things went well status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                //if response is nil:
                completed(.failure(.invalidResponse))
                return
            }
            
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
    
}
