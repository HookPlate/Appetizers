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
    
    var isValidForm: Bool {
        //we perform all these checks, if any of them fail we return false, if they pass we return true.
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            
            return false
        }
        
        guard email.isValidEmail else {
            
            return false
        }
        
        return true
    }
}
