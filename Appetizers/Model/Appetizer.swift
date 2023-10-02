//
//  Appetizer.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import Foundation
//We could've used Codable but since we don't need to encode Data we're fine with just Decodable.
struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    //a common mistake for below would be to do imageUrl but it needs to match the JSON exactly (what's coming from the API), there it is imageURL. Although it is possoble to use CodingKeys.
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
//The below contains an array of the above, we're just mirroring the structure of the JSON.
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Slow Cooked Beef",
                                           description: "You'll need extra napkins with these tasty treats.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemOne = Appetizer(id: 0001,
                                           name: "Slow Cooked Beef 1",
                                           description: "You'll need extra napkins with these tasty treats.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 0002,
                                           name: "Slow Cooked Beef 2",
                                           description: "You'll need extra napkins with these tasty treats.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemThree = Appetizer(id: 0003,
                                           name: "Slow Cooked Beef 3",
                                           description: "You'll need extra napkins with these tasty treats.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
