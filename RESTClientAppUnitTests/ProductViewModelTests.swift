//
//  ProductViewModelTests.swift
//  RESTClientAppUnitTests
//
//  Created by Dominik Urbaez Gomez on 17/10/2020.
//

import Quick
import Nimble
@testable import RESTClientApp

class ProductViewModelTests: QuickSpec {
    override func spec() {
        var viewModel: ProductViewModel!
        describe("ProductViewModel tests") {
            context("Behaves properly when all data is provided") {
                afterEach {
                    viewModel = nil
                }
                beforeEach {
                    let product = Product(id: 1, brand: "testBrand", caption: "testCaption", name: "testName", price: 99.34000, pictures: mockPictures)
                    viewModel = ProductViewModel(product: product)
                }
                it("sets correct id") {
                    expect(viewModel.id).to(equal(1))
                }
                it("provides correct price") {
                    expect(viewModel.getFormattedPrice).to(equal("99.34"))
                }
                it("provides correct image URLs") {
                    expect(viewModel.getImageUrl(type: .small)).to(equal("https:small"))
                    expect(viewModel.getImageUrl(type: .large)).to(equal("https:large"))
                }
                it("conforms to Equatable correctly") {
                    let equalViewModel = ProductViewModel(product: Product(id: 1, brand: "testBrand", caption: "testCaption", name: "testName", price: 99.34000, pictures: mockPictures))
                    expect(viewModel).to(equal(equalViewModel))
                    let differentViewModel = ProductViewModel(product: Product(id: 2, brand: "testBrand", caption: "testCaption", name: "testName", price: 99.34000, pictures: mockPictures))
                    expect(viewModel).toNot(equal(differentViewModel))
                }
            }
        }
    }
}
