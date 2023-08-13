//
//  MockPostNetworking.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 5/8/23.
//

import Foundation

class MockProductService: ServiceProtocol {
    
    func fetchData(completion: @escaping (Result<ProductModel, APIError>) -> Void) async{

        guard let sampleData: ProductModel = readJSONFromFile(fileName: "SamplePost")else {
            completion(.failure(.invalidData))
            return
        }
        completion(.success(sampleData))

    }
    
}
