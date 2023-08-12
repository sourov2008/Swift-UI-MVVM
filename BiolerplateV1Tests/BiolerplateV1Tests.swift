//
//  BiolerplateV1Tests.swift
//  BiolerplateV1Tests
//
//  Created by Shourob Datta on 3/8/23.
//

import XCTest
@testable import BiolerplateV1 // Replace with your app name

final class PostViewModelTests: XCTestCase {

    func testFetchPosts() async {
        // Given
        let viewModel = PostViewModel(service: MockPostService())

        // When
        await viewModel.fetchPosts()

        // Then
        XCTAssertTrue(!viewModel.posts.isEmpty, "Posts should not be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "errorMessage should be empty")
    }

    func testFetchPostsWithError() async {
        // Given
        let mockError = APIError.invalidData

        let errorMockNetworking = ErrorMockService(mockError: mockError)
        let viewModel = PostViewModel(service: errorMockNetworking)

        // When
        await viewModel.fetchPosts()

        // Then
        XCTAssertTrue(viewModel.posts.isEmpty, "Posts should be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertEqual(viewModel.errorMessage, "Failed to fetch posts: \(mockError.getErrorMessage())", "errorMessage should match the error message")
        
    }
    
    
    func testMarkAsFavourite() async {
        // Given
        let viewModel = PostViewModel(service: MockPostService())

        // When
        await viewModel.fetchPosts()
        
        // target first index.
        var firstIndex = viewModel.posts[0] // curretnly fav as false

        // When: We mark post1 as favorite
         viewModel.markAsFavorite(post: firstIndex)
         firstIndex = viewModel.posts[0] // This supposed to now true

        // Then: The favorite status of post1 should be toggled
        XCTAssertTrue(firstIndex.favourite == true, "firstIndex should be marked as favorite")
    }
    
}

class ErrorMockService: ServiceProtocol {
    let mockError: APIError

    init(mockError: APIError) {
        self.mockError = mockError
    }

    func fetchData(completion: @escaping (Result<[PostModel], APIError>) -> Void) async{
        completion(.failure(mockError))
    }
}
