//
//  NewTodoViewModel.swift
//  Swift UI MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 9/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import Foundation
import Combine

protocol NewTodoViewModelProtocol {
    func addNewTodo(title: String)
}


final class NewTodoViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}


//// MARK: - NewTodoViewModelProtocol
//extension NewTodoViewModel: NewTodoViewModelProtocol {
//    func addNewTodo(title: String) {
//        let todo = Todo(id: UUID(), title: title, isCompleted: false)
//        dataManager.add(todo: todo)
//    }
//}

// MARK: - NewTodoViewModelProtocol
extension NewTodoViewModel: NewTodoViewModelProtocol {
    func addNewTodo(title: String) {
        dataManager.addTodo(title: title) // call the updated method
    }
}



