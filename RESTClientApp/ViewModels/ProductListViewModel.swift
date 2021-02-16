//
//  ProductListViewModel.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import Resolver
import Combine

class ProductListViewModel: ObservableObject {
    
    private var store: Store = Resolver.resolve()
    var currentPage = 1 // internal access for testing availability
    
    @Published var productViewModels = [ProductViewModel]()
    private var cancellables = Set<AnyCancellable>()
        
    init() {
        store.$products.map { products in
            products.map { product in
                ProductViewModel(product: product)
            }
        }
        .assign(to: \.productViewModels, on: self)
        .store(in: &cancellables)
        loadInitialData()
    }
    
    func checkIfIsLastFetchedProduct(vm: ProductViewModel) {
        if vm == productViewModels.last {
            self.loadMoreData()
        }
    }
    
    func loadInitialData() {
        store.getProducts(page: 1)
    }
    
    func loadMoreData() {
        currentPage += 1
        store.getProducts(page: currentPage)
    }
    
    #if DEBUG
    convenience init(loadTestData: Bool) {
        self.init()
        self.productViewModels = mockProductViewModels
    }
    #endif
}
