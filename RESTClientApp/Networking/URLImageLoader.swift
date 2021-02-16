//
//  URLImageLoader.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import SwiftUI
import Combine

class URLImageLoader: ObservableObject {
    
    @Published var downloadedImage = Image(systemName: "photo")
    var complete: Bool = false
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.downloadedImage = Image(uiImage: uiImage)
                    self.complete = true
                }
            }
        }.resume()
    }
}
