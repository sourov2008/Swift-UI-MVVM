//
//  MockPostNetworking.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 5/8/23.
//

import Foundation

class MockPostService: ServiceProtocol {
    
    func fetchData(completion: @escaping (Result<ProductModel, APIError>) -> Void) async{
        guard let jsonData = readJSONFromFile(named: "SamplePost") else {
            completion(.failure(.invalidData))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let sampleData = try decoder.decode(ProductModel.self, from: jsonData)
            completion(.success(sampleData))
        } catch {
            print("Error decoding JSON data: \(error)")
            completion(.failure(.decodingError))
        }
    }
    
    func readJSONFromFile(named fileName: String) -> Data? {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("Error: JSON file not found.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            return data
        } catch {
            print("Error reading JSON file: \(error)")
            return nil
        }
    }

}
