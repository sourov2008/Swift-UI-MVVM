//
//  DummyJSONToModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 16/8/23.
//

import Foundation

 
    // Define a generic function that takes a JSON file name and returns a Codable struct
    func readJSONFromFile<T: Codable>(fileName: String) -> T? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return nil
    }


