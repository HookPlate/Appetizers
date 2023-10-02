//
//  Alert.swift
//  Appetizers
//
//  Created by robin tetley on 21/09/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Netwrok Alerts
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("The response from the server, please try again later or contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("The url received from the server was invalid, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time, please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    //MARK: - Account Alerts
    
    static let invalidForm       = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct."),
                                            dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was succesfully saved."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retreiving your profile."),
                                            dismissButton: .default(Text("Ok")))
}

