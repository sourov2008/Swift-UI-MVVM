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
}

