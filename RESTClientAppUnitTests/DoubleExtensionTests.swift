//
//  DoubleExtensionTests.swift
//  RESTClientAppUnitTests
//
//  Created by Dominik Urbaez Gomez on 17/10/2020.
//

import Quick
import Nimble
@testable import RESTClientApp

class DoubleExtensionTests: QuickSpec {
    override func spec() {
        describe("Double Extension tests") {
            context("Behaves properly") {
                it("Removes trailing zeros and casts to String") {
                    let unformattedString: Double = 12.324000000
                    expect(unformattedString.removeTrailingZeros).to(equal("12.324"))
                }
            }
        }
    }
}

