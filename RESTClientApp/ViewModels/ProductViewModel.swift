//
//  ProductViewModel.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import Combine
import SwiftUI
import Resolver

enum ImageType {
    case small
    case large
}

class ProductViewModel: ObservableObject, Identifiable, Equatable {
    var store: Store = Resolver.resolve()
    
    @Published var product: Product
    
    var id: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init(product: Product) {
        self.product = product
        $product
            .map { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func getFormattedPrice() -> String {
        return self.product.price.removeTrailingZeros()
    }
    
    func getImageUrl(type: ImageType) -> String {
        switch type {
        case .small:
            return "https:" + self.product.pictures[0].small
        case .large:
            return "https:" + self.product.pictures[0].large
        }
    }
    
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        guard lhs.id == rhs.id else { return false }
        return true
    }
}

#if DEBUG
var mockProductViewModels: [ProductViewModel] = [
    ProductViewModel(product: mockProducts[0]),
    ProductViewModel(product: mockProducts[1]),
    ProductViewModel(product: mockProducts[2]),
    ProductViewModel(product: mockProducts[3]),
    ProductViewModel(product: mockProducts[4]),
]
#endif
