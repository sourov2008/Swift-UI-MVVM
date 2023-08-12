//
//  Post.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import Foundation

struct PostModel: Codable, Identifiable, Equatable {
    
    let id: Int
    let title: String
    let body: String
    var favourite: Bool? = false
    

}
