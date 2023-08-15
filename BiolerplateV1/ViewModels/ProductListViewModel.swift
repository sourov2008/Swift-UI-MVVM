//
//  PostViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    @Published var productsData: ProductModel

    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
        self.productsData = ProductModel(header: Header(headerTitle: "", headerDescription: ""), filters: [], products: [])// By initializing make productsData non optional

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
                self.productsData = data
                isLoading = false

            case .failure(let error):
                // Handle the APIError in the failure case
                self.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"
                isLoading = false

            }

    }
    
    func updateProduct(_ updatedProduct: Product) {
        guard let index = productsData.products.firstIndex(where: { $0.id == updatedProduct.id }) else {
            return
        }
        productsData.products[index] = updatedProduct
    }

    
}
