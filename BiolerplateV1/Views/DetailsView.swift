//
//  DetailsUIView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 13/8/23.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    var onFavoriteChanged: ((Product) -> Void)?

    var body: some View {
        VStack {
            Text(viewModel.details.name)
                .font(.headline)
            Text(viewModel.details.type)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button(action: {
                viewModel.toggleFavorite()
                // Notify the callback when the favorite status changes
                onFavoriteChanged?(viewModel.details)

            }, label: {
                Text(viewModel.details.isFavorite ?? false ? "Remove from Favorites" : "Mark as Favorite")
                    .foregroundColor(.blue)
            })
            
        }
        .navigationTitle("Product Details")
    }
}

 
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ProductDummyModel.product
        return DetailsView(viewModel: ProductDetailsViewModel(details: data.products[0]))
    }
}

