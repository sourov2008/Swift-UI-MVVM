//
//  EmployeeListView.swift
//  Swift UI MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 18/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//https://www.swiftcompiled.com/mvvm-swiftui-and-combine/

import SwiftUI
import SkeletonUI

//struct EmployeeListView: View {
//    //@ObservedObject var viewModel: EmployeeViewModel
//    @ObservedObject var viewModel = EmployeeViewModel()
//
//    //var viewModel: EmployeeViewModel
//
////    init(viewModel: EmployeeViewModel) {
////        self.viewModel = viewModel
////    }
////
//
//    var body: some View {
//        Text("Hello, World!")
//
//
//    }
//}
//
////struct EmployeeListView_Previews: PreviewProvider {
////    static var previews: some View {
////        EmployeeListView()
////        //EmployeeViewModel()
////
////
////    }
////}


struct EmployeeListView: View {
    @ObservedObject var viewModel = EmployeeViewModel()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.employees) { employee in
                Text(employee.fileName ?? "")
                //print(viewModel.isCompleted ?? false)
                //Text("Something")
                  
            }
            .navigationBarTitle("Pokemon")
        }.onAppear {
            self.viewModel.fetchEmployeeList()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}

