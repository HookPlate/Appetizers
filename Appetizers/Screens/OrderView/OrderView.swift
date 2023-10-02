//
//  OrderView.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import SwiftUI

struct OrderView: View {
    
    //@StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(MockData.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                
            }
            .overlay(alignment: .bottom) {
                APButton(title: "$\(MockData.sampleAppetizer.price, specifier: "%.2f") - Add to Order ")
                    .padding(.bottom)
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
