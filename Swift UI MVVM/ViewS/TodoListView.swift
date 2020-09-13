//
//  TodoListView.swift
//  SwiftUI Combine MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 9/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    
    @State private var isShowingAddNew = false
    
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }) {
            Image(systemName: "plus")
        }
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title)
            }
            .navigationBarTitle(Text("Todo List"))
            .navigationBarItems(trailing: addNewButton)
        }
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchTodos()
        }) {
            NewTodoView(viewModel: NewTodoViewModel())
        }
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}
