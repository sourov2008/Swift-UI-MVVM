//
//  BiolerplateV1Tests.swift
//  BiolerplateV1Tests
//
//  Created by Shourob Datta on 16/8/23.
//

import XCTest
@testable import BiolerplateV1

final class ProductListViewModelTests: XCTestCase {

    func testFetchProducts() async {
        // Given
        let viewModel = ProductListViewModel(service: MockProductService())

        // When
        await viewModel.fetchProducts()

        // Then
        XCTAssertTrue(!(viewModel.productsData.products.isEmpty ), "Posts should not be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "errorMessage should be empty")
    }

    func testFetchProductsWithError() async {
        // Given
        let mockError = APIError.invalidData

        let errorMockNetworking = ErrorMockService(mockError: mockError)
        let viewModel = ProductListViewModel(service: errorMockNetworking)

        // When
        await viewModel.fetchProducts()

        // Then
        XCTAssertTrue(viewModel.productsData.products.isEmpty , "Posts should be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertEqual(viewModel.errorMessage, "Failed to fetch products: \(mockError.getErrorMessage())", "errorMessage should match the error message")
        
    }
    
    // pass means updated successsfully added into product array.
    func testHandlePickerSelectionChange() async  {
        
        let viewModel = ProductListViewModel(service: MockProductService())
        await viewModel.fetchProducts()
        viewModel.selectedFilterItem = .available
        
        // before
        let index = viewModel.productsData.products.filter{ $0.available == true }
        
        viewModel.handlePickerSelectionChange()
        //after
        let filtered = viewModel.productsData.products
        
        XCTAssertEqual(index.count, filtered.count, "Failed to filter item as available")
    }

    
    // pass means updated successsfully added into product array.
    func testMarkAsFavUnfavorite() async  {
        
        let viewModel = ProductListViewModel(service: MockProductService())
        await viewModel.fetchProducts()
        
        guard var product = viewModel.productsData.products.first else {
            return
        }
        product.isFavorite = false // Mark as unfavourite
        
        viewModel.markAsFavouriteUnfavourite(updatedProduct: product)
        let isAvilableUpdatedProduct = viewModel.productsData.products.contains(product)
        XCTAssertTrue(isAvilableUpdatedProduct, "Failed to mark as favorite or unfavorite")
    }
}

class ErrorMockService: ServiceProtocol {
    
    let mockError: APIError

    init(mockError: APIError) {
        self.mockError = mockError
    }

    func fetchData() async -> Result<ProductModel, APIError> {
        return .failure(mockError)
    }

    
}
