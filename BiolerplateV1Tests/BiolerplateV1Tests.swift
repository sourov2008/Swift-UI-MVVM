//
//  BiolerplateV1Tests.swift
//  BiolerplateV1Tests
//
//  Created by Shourob Datta on 3/8/23.
//

import XCTest
@testable import BiolerplateV1 // Replace with your app name

final class ProductListViewModelTests: XCTestCase {

    func testFetchPosts() async {
        // Given
        let viewModel = ProductListViewModel(service: MockProductService())

        // When
        await viewModel.fetchPosts()

        // Then
        XCTAssertTrue(!(viewModel.productsData.products.isEmpty ), "Posts should not be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "errorMessage should be empty")
    }

    func testFetchPostsWithError() async {
        // Given
        let mockError = APIError.invalidData

        let errorMockNetworking = ErrorMockService(mockError: mockError)
        let viewModel = ProductListViewModel(service: errorMockNetworking)

        // When
        await viewModel.fetchPosts()

        // Then
        XCTAssertTrue(viewModel.productsData.products.isEmpty , "Posts should be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertEqual(viewModel.errorMessage, "Failed to fetch posts: \(mockError.getErrorMessage())", "errorMessage should match the error message")
        
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
