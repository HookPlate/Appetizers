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
    
    var isValidForm: Bool {
        //we perform all these checks, if any of them fail we return false, if they pass we return true.
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        //if isValidForm is false we return out of this functionand show the error thanks to the above. Couldn't get my head around this to begin with , perhaps it is not that the computed property is calculated constantly, it's only computed when the property is chaecked below. Yes, I guess so, since this function is only run when the user taps save in the AccountView.
        guard isValidForm else { return }
        
        print("Changes have been saved successfully")
    }
}
