//
//  NumberFormatting.swift
//  RESTClientApp
//
//  Created by Dominik Urbaez Gomez on 16/10/2020.
//

import Foundation

extension Double {
    func removeTrailingZeros() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        return String(formatter.string(from: number) ?? "")
    }
}
