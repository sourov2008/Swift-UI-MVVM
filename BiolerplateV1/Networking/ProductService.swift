//
//  PostService.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 5/8/23.
//

/* Whenever we will make a API call, we will use the service class to access network manager. We will prepare the necessary data to make a api call. like url, params, header etcs. */

import Foundation

protocol ServiceProtocol {
    
    func fetchData() async -> Result<ProductModel, APIError>
}


final class ProductService: ServiceProtocol {

//    func fetchData(completion: @escaping (Result<ProductModel, APIError>) -> Void) async{
//        let baseURL = "https://app.check24.de/products-test.json"
//        let router = NetworkRouter(baseURL: baseURL)
//
//        /* You may pass necessary header, params etcs. */
//
//        router.sendRequest(path: "/products-test.json", method: .get) { (result: Result<ProductModel, APIError>) in
//            switch result {
//            case .success(let posts):
//                print("Users: \(posts)")
//                completion(.success(posts)) // Wrap 'posts' in a Result.success
//            case .failure(let error):
//                // Handle the error case
//                completion(.failure(error)) // Wrap 'error' in a Result.failure
//                print("error: \(error)")
//
//            }
//        }
//    }
    
    func fetchData() async -> Result<ProductModel, APIError> {
        let baseURL = "https://app.check24.de"
        let router = NetworkRouter(baseURL: baseURL)
        
        do {
            let result: Result<ProductModel, APIError> =  await router.sendRequest(path: "/products-test.json", method: .get)
            return result
        }
        
    }

}


//// Example POST request
//let headers = ["Content-Type": "application/json"]
//let requestBody = try? JSONSerialization.data(withJSONObject: ["username": "example", "password": "secret"], options: [])
//router.sendRequest(path: "login", method: .post, headers: headers, body: requestBody) { (result: Result<Bool, Error>) in
//    switch result {
//    case .success(let isLoggedIn):
//        // Handle the success case with the isLoggedIn status
//        print("Is Logged In: \(isLoggedIn)")
//    case .failure(let error):
//        // Handle the error case
//        print("Error: \(error)")
//    }
//}
