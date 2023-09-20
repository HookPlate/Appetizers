//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by robin tetley on 20/09/2023.
//

import SwiftUI

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            //thanks to @escaping you're not on the main thread here and you need to be because changing appetizers triggers a UI redraw.
            //the above makes the network call, when it gets that back it does the below.
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
