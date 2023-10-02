//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by robin tetley on 27/09/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    //Saves to UserDefaults which gets deleted when the app is deleted but will persist bewtween app launches.
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    func saveChanges() {
        //first check if form is valid. We don't want to save anything that isn't valid
        guard isValidForm else { return }
        
        //very similar to the decoding block in Network Manager. The user thanks to @Published is now full of data let save it:
        do {
            let data = try JSONEncoder().encode(user)
            //this saves it to userdefaults with the key 'user.'
            userData = data
            //means they get confimration it was saved
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    //gets called onAppear in AccountView
    func retreiveUser() {
        //jump out of here if the userData is empty.
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            //if we try to pull out a user and we can't do it
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        //we perform all these checks, if any of them fail we return false, if they pass we return true.
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
}
