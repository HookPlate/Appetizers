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
    //@state private var issShowingDetail = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        //.listRowSeparator(.hidden)
                        //.listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .disabled(viewModel.isShowingDetail)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
                    .transition(.move(edge: .bottom))
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        
        //the isPresented version of this modifier is for use with a bool, the item one is for when an item changes.
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
