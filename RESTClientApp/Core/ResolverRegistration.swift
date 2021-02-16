//
//  AppConfiguration+Resolver.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { AppConfiguration() as AppConfiguration }.scope(application)
    register { Store() as Store }.scope(application)
  }
}
