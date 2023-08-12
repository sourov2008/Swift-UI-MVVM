//
//  ContentView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject private var viewModel = PostViewModel(service: PostService())

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                Task {
                    await viewModel.fetchPosts()
                }
                
            }
        }
    }

    
}


//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = PostViewModel(networking: MockPostNetworkManager())
//        return PostListView().environmentObject(viewModel)
//    }
//}



struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PostViewModel(service: MockPostService())
        viewModel.posts = [
            PostModel(id: 1, title: "Test Title 1", body: "Test Body 1"),
            PostModel(id: 2, title: "Test Title 2", body: "Test Body 2")
        ]

        return PostListView().environmentObject(viewModel)
    }
}


