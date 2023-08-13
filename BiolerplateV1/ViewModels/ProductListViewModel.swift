//
//  PostViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
        Task {
            await fetchPosts()
        }
    }
    
    
    @MainActor func fetchPosts() async {
        isLoading = true

            let result =  await service.fetchData()
            switch result {
            case .success(let data):
                // Handle the successful case with the productModel
                self.products = data.products
                isLoading = false


            case .failure(let error):
                // Handle the APIError in the failure case
                self.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"
                isLoading = false


            }

        
    }
    
}
