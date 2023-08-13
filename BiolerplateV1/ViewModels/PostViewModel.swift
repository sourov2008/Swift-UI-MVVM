//
//  PostViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import Foundation

class PostViewModel: ObservableObject {
    
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
           await service.fetchData { [weak self] (result: Result<ProductModel, APIError>)in
               
               DispatchQueue.main.async {
                   switch result {
                       
                   case .success(let data):
                       self?.products = data.products
                       
                   case .failure(let error):
                       self?.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"

                   }

                   self?.isLoading = false
               }

           }
       }
}
