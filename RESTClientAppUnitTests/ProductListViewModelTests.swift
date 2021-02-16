//
//  ProductListViewModelTests.swift
//  RESTClientAppUnitTests
//
//  Created by Dominik Urbaez Gomez on 17/10/2020.
//

import Quick
import Nimble
@testable import RESTClientApp

class ProductListViewModelTests: QuickSpec {
    override func spec() {
        var listViewModel: ProductListViewModel!
        describe("ProductViewModel tests") {
            context("Behaves properly when all data is provided") {
                afterEach {
                    listViewModel = nil
                }
                beforeEach {
                    listViewModel = ProductListViewModel()
                    listViewModel.productViewModels = mockProductViewModels
                }
                it("initializes currentPage correctly") {
                    expect(listViewModel.currentPage).to(equal(1))
                }
                it("stores viewModels in correct order") {
                    let viewModel = mockProductViewModels.last!
                    listViewModel.checkIfIsLastFetchedProduct(vm: viewModel)
                    expect(listViewModel.currentPage).to(equal(2))
                }
            }
        }
    }
}

