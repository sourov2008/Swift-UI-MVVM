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
        ScrollView {
            VStack (spacing: 16){

                if viewModel.details.available == true {
                    AvailableProductView(product: viewModel.details)
                } else {
                    UnavailableProductView(product: viewModel.details)
                }
                
                Button(action: {
                    viewModel.toggleFavorite()
                    // Notify the callback when the favorite status changes
                    onFavoriteChanged?(viewModel.details)

                }, label: {
                    Text(viewModel.details.isFavorite ?? false ? "Remove from Favorites" : "Mark as Favorite")
                        .foregroundColor(.blue)
                })
                
                VStack (alignment: .leading, spacing: 16){
                    Text("Description")
                        .fontWeight(.bold)
                    Text(viewModel.details.longDescription)

                }
                
                Link("Ⓒ 2016 Check24", destination: URL(string: "https://www.check24.de/popup/datenschutz-check24-gmbh/")!)
                    .foregroundColor(.blue)
                    .italic()

                
            }
            .navigationTitle("Product Details")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.all)
        }
    }
}

private struct AvailableProductView: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .center) {
            ProductImageView(product: product)
            VStack(alignment: .leading, spacing: 12) {
                HStack{
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(product.isFavorite ?? false ? .blue:.black )
                    Spacer()
                    Text(product.releaseDate.toDateFormatted(withFormat: Constant.DateFormat.dd_mm_yyyy))
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                HStack{
                    Text("Preis:")
                        .fontWeight(.semibold)
                    Text(product.price.value.description)
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text(product.price.currency)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }

                RatingView(rating: product.rating.roundedDownToNearestHalf())
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                

            }
        }
    }
}

private struct UnavailableProductView: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(product.isFavorite ?? false ? .blue:.black )

                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                RatingView(rating: product.rating.roundedDownToNearestHalf())
            }
            Spacer()
            ProductImageView(product: product)
        }
    }
}

 
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ProductDummyModel.product
        return DetailsView(viewModel: ProductDetailsViewModel(details: data.products[0]))
    }
}

