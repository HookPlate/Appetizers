//
//  Order.swift
//  Appetizers
//
//  Created by robin tetley on 03/10/2023.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        //look up reduce, this goes through the whole array and adds all the proces up to one total here: (0)
        items.reduce(0){ $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offSets: IndexSet) {
        items.remove(atOffsets: offSets)
    }
}
