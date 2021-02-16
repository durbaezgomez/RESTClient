//
//  ProductListView.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.productViewModels) { vm in
                    NavigationLink(destination: ProductDetailView(viewModel: vm)) {
                        ProductRowView(viewModel: vm).onAppear(perform: {
                            viewModel.checkIfIsLastFetchedProduct(vm: vm)
                        })
                    }
                    .listRowBackground(Color.lightRedBackground)
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "cart").foregroundColor(.white)
                        Text("Products")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
        }
        .accentColor(.white)
        .buttonStyle(PlainButtonStyle())
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewModel: ProductListViewModel(loadTestData: true))
    }
}
