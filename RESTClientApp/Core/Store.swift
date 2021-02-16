//
//  Store.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import Resolver

class Store {
    private var appConfiguration: AppConfiguration = Resolver.resolve()
    private var apiClient: APIClient
    @Published var products = [Product]()
        
    init() {
        self.apiClient = appConfiguration.apiClient
    }
    
    func getProducts(page: Int) {
        apiClient.getProducts(page: page) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                DispatchQueue.main.async {
                    self?.products += data.products
                }
            }
        }
    }
}
