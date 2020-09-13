//
//  DataManager.swift
//  SwiftUI Combine MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 9/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool) -> [Todo]
    func addTodo(title: String) // updated method
    func toggleIsCompleted(for todo: Todo)
}

 class DataManager {
     static let shared: DataManagerProtocol = DataManager()
     
     private var todos = [Todo]()
     
     private init() { }
 }



// MARK: - DataManagerProtocol
extension DataManager: DataManagerProtocol {
    
    func addTodo(title: String) { // updated method
        let todo = Todo(title: title)
        todos.insert(todo, at: 0)
    }
    
    
    
    func fetchTodoList(includingCompleted: Bool = false) -> [Todo] {
        includingCompleted ? todos : todos.filter { !$0.isCompleted }
    }
    
    
    func toggleIsCompleted(for todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
}



