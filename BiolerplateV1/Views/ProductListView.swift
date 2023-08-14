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
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                    } else {
                        List(viewModel.products) { product in

                            
                            NavigationLink {
                                DetailsView(viewModel: ProductDetailsViewModel(details: product)){ updatedProduct in
                                    viewModel.updateProduct(updatedProduct)
                                }
                                
                            } label: {
                                
                                VStack {
                                    HStack    {
                                        ProductImageView(product: product)
                                        
                                        VStack(alignment: .leading) {
                                            Text(product.name)
                                                .font(.headline)
                                            Text(product.type)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            if (product.isFavorite == true) {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                            }
                                        }

                                    }
                                }
                                
                                
                            }
           
                        }
                        
                    }
                }
                .navigationTitle("Products")
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
            @unknown default:
                // Since the AsyncImagePhase enum isn't frozen,
                // we need to add this currently unused fallback
                // to handle any new cases that might be added
                // in the future:
                EmptyView()
            }
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


