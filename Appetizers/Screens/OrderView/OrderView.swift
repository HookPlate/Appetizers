//
//  OrderView.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import SwiftUI

struct OrderView: View {
    
   // this just used for building the ui and structure @State private var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                           
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                //like in AppetizerListView we smack our empty state on top of everything if that array is empty.
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add an appetizer.")
                }
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
