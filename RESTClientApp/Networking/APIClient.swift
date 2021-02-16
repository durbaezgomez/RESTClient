//
//  APIClient.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation

enum NetworkError: Error {
    case networkError
}

struct DataObject: Codable {
    public var products: [Product]
}

struct Response: Codable {
    public var data: DataObject
}

enum Endpoint: String {
    case products = "Products"
}

class APIClient {
    private var api: String
    
    init(api: String) {
        self.api = api
    }
    
    func getProducts(page: Int, onComplete: @escaping(Result<DataObject, NetworkError>) -> Void) {
        let endpoint: Endpoint = .products
        var productsUrl = URLComponents(string: (self.api + endpoint.rawValue))
        let params = ["Page": String(page)]
        var items = [URLQueryItem]()
        
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        productsUrl?.queryItems = items
        
        guard let url = productsUrl?.url else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    onComplete(.success(decodedResponse.data))
                    return
                }
            }
            print(error ?? "Unknown error")
            onComplete(.failure(.networkError))
        }.resume()
    }
}
