//
//  ProductDetailsViewModelTests.swift
//  BiolerplateV1Tests
//
//  Created by Shourob Datta on 16/8/23.
//

import XCTest
@testable import BiolerplateV1

final class ProductDetailsViewModelTests: XCTestCase {

    func testToggleFavorite() async {
        
        let viewModel = ProductListViewModel(service: MockProductService())
        await viewModel.fetchProducts()
        
        guard let initialProductDetails: Product = viewModel.productsData.products.first else {
            return
        }
        var toggleProductDetails = ProductDetailsViewModel(details: initialProductDetails)
        toggleProductDetails.toggleFavorite()
        
        XCTAssertNotEqual(initialProductDetails.isFavorite, toggleProductDetails.details.isFavorite, "Favorite/Unfavorite status not changing")
        
    }
}
