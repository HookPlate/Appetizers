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
}

