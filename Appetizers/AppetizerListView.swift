//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by robin tetley on 19/09/2023.
//

import SwiftUI

struct AppetizerListView: View {
    //being @state when the below fills it redraws the view.
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear{
            viewModel.getAppetizers()
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
