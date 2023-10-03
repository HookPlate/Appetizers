//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by robin tetley on 20/09/2023.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            //thanks to @escaping you're not on the main thread here and you need to be because changing appetizers triggers a UI redraw.
//            //the above makes the network call, when it gets that back it does the below.
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case.failure(let error):
//                    //show an alert depending on what error gets passed to our failurer case.
//                    switch error {
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                //this is where we do the network call and since it's marked to throw in NetworkManager we need to put it in a Do Try Catch block.
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                //this is where we catch any error coming back, firstly checking if it's one of our custom ApErrors:
                if let apError = error as? APError {
                    switch apError {
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    //the generic error placeholder that URLSession might throw back from the manager.
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
