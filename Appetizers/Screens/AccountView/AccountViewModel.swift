//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by robin tetley on 27/09/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthDate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    
    func saveFormChanges() {
        if isValidForm {
            print("The form is filled in correctly")
        } else {
            print("You're missing details in the form")
        }
    }
    
    var isValidForm: Bool {
        //we perform all these checks, if any of them fail we return false, if they pass we return true.
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertFormContext.emptyField
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertFormContext.isValidEmal
            return false
        }
        
        return true
    }
}
