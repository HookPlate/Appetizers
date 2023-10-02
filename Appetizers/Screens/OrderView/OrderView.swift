//
//  OrderView.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(MockData.orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                }
                .listStyle(PlainListStyle())
                
                Button {
                    print("Order placed")
                } label: {
                    APButton(title: "$99.99 Place Order ")
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("🧾Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
