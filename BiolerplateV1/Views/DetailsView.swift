//
//  PostDetail.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 6/8/23.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: PostViewModel
    var post: PostModel

    var body: some View {
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

            Button(action: {
                viewModel.markAsFavorite(post: post)
            }) {
                Text("Mark as Favorite")
            }
        }
        .padding()
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
