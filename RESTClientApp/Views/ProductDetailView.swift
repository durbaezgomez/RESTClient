//
//  ProductDetailView.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import SwiftUI

struct ProductDetailView: View {
    var viewModel: ProductViewModel
    var body: some View {
        VStack() {
            Spacer()
            URLImage(url: viewModel.getImageUrl(type: .large))
                .frame(width: 200, height: 300, alignment: .center)
                .padding(EdgeInsets(top: 100, leading: 10, bottom: 100, trailing: 10))
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.product.brand)
                        .font(.headline)
                    Text(viewModel.product.caption)
                        .font(.caption)
                    Text(viewModel.product.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding()
                Spacer()
            }
            HStack {
                Spacer()
                Text(viewModel.getFormattedPrice())
                    .font(.title)
                Text("PLN")
            }
            .padding()
            Spacer()
        }
        .background(Color.lightRedBackground)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: mockProductViewModels[0])
    }
}
