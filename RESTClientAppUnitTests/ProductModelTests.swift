//
//  ProductModelTests.swift
//  RESTClientAppUnitTests
//
//  Created by Dominik Urbaez Gomez on 17/10/2020.
//

import Quick
import Nimble
@testable import RESTClientApp

class ProductModelTests: QuickSpec {
    override func spec() {
        var product: Product!
        describe("Product model tests") {
            context("Can be created properly when all data is provided") {
                afterEach {
                    product = nil
                }
                beforeEach {
                    product = Product(id: 1, brand: "testBrand", caption: "testCaption", name: "testName", price: 99, pictures: mockPictures)
                }
                it("sets correct id") {
                    expect(product.id).to(equal(1))
                }
                it("sets correct brand") {
                    expect(product.brand).to(equal("testBrand"))
                }
                it("sets correct caption") {
                    expect(product.caption).to(equal("testCaption"))
                }
                it("sets correct name") {
                    expect(product.name).to(equal("testName"))
                }
                it("sets correct price") {
                    expect(product.price).to(equal(99))
                }
                it("provides correct full name") {
                    expect(product.getFullName()).to(equal("testBrand\ntestCaption\ntestName"))
                }
                it("provides correct picture arrays") {
                    expect(product.pictures.count).to(equal(1))
                    expect(product.pictures[0].id).to(equal(1))
                    expect(product.pictures[0].small).to(equal("small"))
                    expect(product.pictures[0].large).to(equal("large"))
                }
            }
        }
    }
}
