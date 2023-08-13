//
//  Post.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
// for model class creation you can use this. But not perfect.
// best is use chatGpt


import Foundation

import Foundation

struct Header: Codable {
    let headerTitle: String
    let headerDescription: String
}

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let color: String
    let imageURL: String
    let colorCode: String
    let available: Bool
    let releaseDate: Int
    let description: String
    let longDescription: String
    let rating: Double
    let price: Price
}

struct Price: Codable {
    let value: Double
    let currency: String
}

struct ProductModel: Codable {
    
    let header: Header
    let filters: [String]
    let products: [Product]
    
    
//    static var stubs : ProductModel{
//        let data: ProductModel = DummyJSONToModel().decodeJSONFromFile(fileName: "defaultData") as! ProductModel
//    }
    
//    static let ProductModelDefautls : ProductModel = DummyJSONToModel().decodeJSONFromFile(fileName: "SamplePost") as! ProductModel
//
//    // You can call the function like this:
//    if let data: ProductModel = decodeJSONFromFile(fileName: "defaultData") {
//        // Use the decoded data
//        print("Loaded data: \(data)")
//    } else {
//        print("Failed to load data")
//    }
    
    
}

struct ProductDummyModel {
    static let product: ProductModel = {
        if let defaultData: ProductModel = DummyJSONToModel(fileName: "SamplePost") {
            return defaultData
        } else {
            fatalError("Failed to load default data")
        }
    }()
}



 


