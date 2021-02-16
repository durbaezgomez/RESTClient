//
//  AppConfiguration.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import UIKit
import SwiftUI

class AppConfiguration {
    private var api = "api.mock.com"
    var apiClient: APIClient
    
    init() {
        apiClient = APIClient(api: api)
        setupAppearance()
    }
    
    private func setupAppearance() {
        UITableView.appearance().backgroundColor = UIColor(Color.lightRedBackground)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(Color.lightRedBackground)
        UITableViewCell.appearance().selectedBackgroundView = backgroundView
        UINavigationBar.appearance().backgroundColor = UIColor(Color.lightRedBackground)
        UINavigationBar.appearance().barTintColor = UIColor(Color.lightRedBackground)
    }
}
