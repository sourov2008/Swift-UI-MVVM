//
//  PostViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
    }
    
    @MainActor func fetchPosts() async {
 
           isLoading = true
           await service.fetchData { [weak self] (result: Result<[PostModel], APIError>)in
               
               DispatchQueue.main.async {
                   switch result {
                       
                   case .success(let posts):
                       self?.posts = posts
                       
                   case .failure(let error):
                       self?.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"

                   }

                   self?.isLoading = false
               }

           }
       }
}
