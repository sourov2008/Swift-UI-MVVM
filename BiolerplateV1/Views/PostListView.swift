//
//  ContentView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel = PostViewModel(service: PostService())
    @State private var selectedPost: PostModel?

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
                            HStack {
                                Text(post.title)
                                    .font(.headline)
                                if post.favourite == true {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                            Text(post.body)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .onTapGesture {
                            selectedPost = post
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
            .sheet(item: $selectedPost) { post in
                DetailsView(viewModel: viewModel, post: post)
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
            PostModel(id: 1, title: "Test Title 1", body: "Test Body 1", favourite: false),
            PostModel(id: 2, title: "Test Title 2", body: "Test Body 2", favourite: false)
        ]

        return PostListView().environmentObject(viewModel)
    }
}


