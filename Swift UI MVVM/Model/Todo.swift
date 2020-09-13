//
//  Todo.swift
//  SwiftUI Combine MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 9/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//


import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
