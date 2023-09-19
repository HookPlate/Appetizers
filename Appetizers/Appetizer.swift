//
//  Appetizer.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import Foundation

struct Appetizer {
    let id: Int
    let name: String
    let description: String
    let price: Double
    //a common mistake for below would be to do imageUrl but it needs to match the JSON exactly (what's coming from the API), there it is imageURL.
    let imageURL: String
    
}
