//
//  TodoListViewModel.swift
//  SwiftUI Combine MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 9/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import Foundation
import Combine

protocol TodoListViewModelProtocol {
    var todos: [Todo] { get }
    var showCompleted: Bool { get set }
    func fetchTodos()
    func toggleIsCompleted(for todo: Todo)
}



final class TodoListViewModel: ObservableObject {
    @Published var todos = [Todo]()
    @Published var showCompleted = false
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchTodos()
    }
}


// MARK: - TodoListViewModelProtocol
extension TodoListViewModel: TodoListViewModelProtocol {
    func fetchTodos() {
        todos = dataManager.fetchTodoList(includingCompleted: showCompleted)
    }
    
    func toggleIsCompleted(for todo: Todo) {
        dataManager.toggleIsCompleted(for: todo)
    }
}

