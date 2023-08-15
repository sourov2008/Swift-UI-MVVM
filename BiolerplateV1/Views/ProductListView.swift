//
//  ContentView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import SwiftUI

    struct ProductListView: View {
        
        @ObservedObject private var viewModel = ProductListViewModel(service: ProductService())

        var body: some View {
            NavigationView {

                if viewModel.isLoading {
                        ProgressView()
                    } else if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                    } else {
                        List {
                            HeaderView(header: viewModel.productsData.header)
                            
                            ForEach(viewModel.productsData.products) { product in
                                NavigationLink {
                                    DetailsView(viewModel: ProductDetailsViewModel(details: product)) { updatedProduct in
                                        viewModel.markAsFavUnfavourite(updatedProduct)
                                    }
                                }
                            label: {
                                    ProductRowView(product: product)
                                    
                                }
                                
                            }
                            Link("Ⓒ 2016 Check24", destination: URL(string: "https://www.check24.de/popup/datenschutz-check24-gmbh/")!)
                                .foregroundColor(.blue)
                                .italic()
                            // I forgot the exact link
                        }
                        .navigationTitle("Products")
                        //.navigationBarTitleDisplayMode(.inline)
                        

                    }
                
            }
        }

    }


struct HeaderView: View {
    let header: Header
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header.headerTitle)
                .fontWeight(.semibold)
            Text(header.headerDescription)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack(alignment: .center) {

            if product.available == true {
                ProductImageView(product: product)
            }
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Text(product.type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                if product.isFavorite == true {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            
            if product.available == false {
                Spacer()
                ProductImageView(product: product)
            }

        }
    }
}
 

struct ProductImageView : View {
    
    var product : Product
    
    var body: some View {
        
        AsyncImage(url: product.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(maxWidth: 60, maxHeight: 60)
            case .failure:
                Image(systemName: "photo")
                    .frame(width: 60, height: 60)
                    .font(.system(size: 50))

            @unknown default:
                // Since the AsyncImagePhase enum isn't frozen,
                // we need to add this currently unused fallback
                // to handle any new cases that might be added
                // in the future:
                Image(systemName: "photo")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }
        }
  
    }
    
}

struct PostListView_RealPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductListViewModel(service: MockProductService())
        return ProductListView().environmentObject(viewModel)
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


