//
//  HomeView.swift
//  Swift UI MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 15/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    
//    var body: some View {
//        VStack(spacing : 16) {
//            Button(action: {
//                //self.showDetails.toggle()
//            }) {
//                Text("API")
//            }
//
//            Button(action: {
//                //self.showDetails.toggle()
//            }) {
//                Text("User Input")
//            }
//
//        }
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack() {
                    NavigationLink(destination: EmployeeListView())
                    { Text("API ") }
                
                    
                    NavigationLink(destination: TodoListView())
                    { Text("INPUT OUTPUT") }
                    
                }
                
                
    
//                Button(action: {
//                    //self.showDetails.toggle()
//                    NavigationLink(destination: TodoListView()) {
//                        Text("User Input")
//                    }
//
//                }) {
//                    Text("API")
//                }

//                NavigationView {
//
//                    NavigationLink(destination: TodoListView()) {
//                        Text("User Input")
//                    }
//
//                }
                
//                NavigationView {
//
//                    NavigationLink(destination: TodoListView()) {
//                        Text("API")
//                    }
//
//                }
                
                
            }
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
