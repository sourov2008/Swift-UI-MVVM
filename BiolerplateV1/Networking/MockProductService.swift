//
//  MockPostNetworking.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 5/8/23.
//

import Foundation

class MockProductService: ServiceProtocol {
    
    func fetchData() async -> Result<ProductModel, APIError> {
        guard let sampleData: ProductModel = readJSONFromFile(fileName: "SamplePost")else {
            return.failure(.invalidData)
            
        }
        return .success(sampleData)

    }
    
    
//    func fetchData(completion: @escaping (Result<ProductModel, APIError>) -> Void) {
//
//        guard let sampleData: ProductModel = readJSONFromFile(fileName: "SamplePost")else {
//            completion(.failure(.invalidData))
//            return
//        }
//        completion(.success(sampleData))
//
//    }
    
}
