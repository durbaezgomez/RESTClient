//
//  ProductRowView.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import SwiftUI

struct ProductRowView: View {
    var viewModel: ProductViewModel
    
    var body: some View {
        HStack {
            URLImage(url: viewModel.getImageUrl(type: .small))
                .frame(width: 70, height: 80, alignment: .center)
                .padding(.trailing, 5)
            VStack(alignment: .leading) {
                Text(viewModel.product.brand)
                    .font(.headline)
                    .lineLimit(2)
                Text(viewModel.product.caption)
                    .font(.caption)
                Text(viewModel.product.name ?? "")
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2)
            }
            Spacer()
            Text("\(viewModel.getFormattedPrice())")
                .font(.title2)
            Text("PLN")
                .fontWeight(.light)
        }
        .foregroundColor(.white)
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 15))
        .background(Color.lightRedBackground)

    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(viewModel: mockProductViewModels[0])
    }
}
