//
//  Post.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
// for model class creation you can use this. But not perfect.
// best is use chatGpt


import Foundation

struct Header: Codable , Equatable{
    let headerTitle: String
    let headerDescription: String
}

struct Product: Codable, Identifiable , Equatable{
    let id: Int
    let name: String
    let type: String
    let color: String
    let imageURL: URL
    let colorCode: String
    let available: Bool
    let releaseDate: Int
    let description: String
    let longDescription: String
    let rating: Double
    let price: Price
    var isFavorite: Bool? = false

}

struct Price: Codable , Equatable{
    let value: Double
    let currency: String
}

struct ProductModel: Codable, Equatable {
    
    let header: Header
    let filters: [String]
    var products: [Product]
    
}

struct ProductDummyModel {
    static let product: ProductModel = {
        if let defaultData: ProductModel = readJSONFromFile(fileName: "SamplePost") {
            return defaultData
        } else {
            fatalError("Failed to load default data")
        }
    }()
}



 


