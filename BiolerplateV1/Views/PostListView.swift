//
//  ContentView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import SwiftUI

struct PostListView: View {
    
    @ObservedObject private var viewModel = ProductListViewModel(service: ProductService())

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                } else {
                    List(viewModel.products) { post in
                        VStack(alignment: .leading) {
                            Text(post.name)
                                .font(.headline)
                            Text(post.type)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Products")
        }
    }
    
}



//struct PostListView_Mock_Previews: PreviewProvider {
//    static var previews: some View {
//        // Use the mock service for previews
//        let data = ProductDummyModel.product
//        let viewModel = PostViewModel(service: MockProductService())
//
//        let viewModel = data.products
//        return PostListView().environmentObject(viewModel)
//    }
//}


struct PostListView_RealPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductListViewModel(service: MockProductService())
        return PostListView().environmentObject(viewModel)
    }
}



//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = PostViewModel(service: MockPostService())
//        viewModel.posts = [
//            PostModel(id: 1, title: "Test Title 1", body: "Test Body 1"),
//            PostModel(id: 2, title: "Test Title 2", body: "Test Body 2")
//        ]
//
//        return PostListView().environmentObject(viewModel)
//    }
//}


