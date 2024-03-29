//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
