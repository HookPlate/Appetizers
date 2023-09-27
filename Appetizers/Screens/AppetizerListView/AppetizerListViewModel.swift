//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by robin tetley on 20/09/2023.
//

import SwiftUI

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            //thanks to @escaping you're not on the main thread here and you need to be because changing appetizers triggers a UI redraw.
            //the above makes the network call, when it gets that back it does the below.
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case.failure(let error):
                    //show an alert depending on what error gets passed to our failurer case.
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                         
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
