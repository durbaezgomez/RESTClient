//
//  Product.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import SwiftUI

struct Picture: Codable {
    var id: Int
    var small: String
    var large: String
    
    init(id: Int, small: String, large: String) {
        self.id = id
        self.small = small
        self.large = large
    }
}

struct Product: Identifiable, Codable {
    var id: Int
    var brand: String
    var caption: String
    var name: String? // some products in example data were missing this property which crashed JSON parsing
    var price: Double
    var pictures: [Picture]
    
    init(id: Int, brand: String, caption: String, name: String, price: Double, pictures: [Picture]) {
        self.id = id
        self.brand = brand
        self.caption = caption
        self.name = name
        self.price = price
        self.pictures = pictures
    }
    
    func getFullName() -> String {
        return self.brand + "\n" + self.caption + "\n" + (self.name ?? "")
    }
}

#if DEBUG
var mockPictures: [Picture] = [
    Picture(id: 1, small: "small", large: "large")
]
var mockProducts: [Product] = [
    Product(id: 1, brand: "Cosmetix", caption: "shampoo", name: "Cocoa Vibe", price: 17.99, pictures: mockPictures),
    Product(id: 2, brand: "Rossmann", caption: "body wash", name: "Vanilla Extract", price: 21.89, pictures: mockPictures),
    Product(id: 3, brand: "Isana", caption: "cream", name: "Sunshine", price: 19.99, pictures: mockPictures),
    Product(id: 4, brand: "Nivea", caption: "face wash", name: "Natural Care", price: 23.99, pictures: mockPictures),
    Product(id: 5, brand: "SkinCare", caption: "face mask", name: "RefreshLite", price: 6.99, pictures: mockPictures)
]
#endif
