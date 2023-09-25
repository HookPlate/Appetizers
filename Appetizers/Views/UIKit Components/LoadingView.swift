//
//  LoadingView.swift
//  Appetizers
//
//  Created by robin tetley on 21/09/2023.
//

import SwiftUI
//This is the old way of doing loading views. Now there's one built into SwiftUI
struct ActivityIndincator: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ActivityIndincator()
        }
    }
}
