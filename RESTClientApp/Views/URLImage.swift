//
//  URLImage.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import SwiftUI

struct URLImage: View {    
    @ObservedObject private var imageLoader = URLImageLoader()
    
    init(url: String) {
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
        if self.imageLoader.complete {
            return AnyView(imageLoader.downloadedImage.resizable().aspectRatio(contentMode: .fit))
        }
        else {
            return AnyView(ProgressView())
        }
    }
}
