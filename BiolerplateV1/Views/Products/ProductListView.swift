//
//  ContentView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import SwiftUI

    struct ProductListView: View {
        
        @StateObject private var viewModel = ProductListViewModel(service: ProductService())
        @State private var selectedItem = 0

        var body: some View {
            NavigationView {
                
                ZStack {
                    Color.blue.opacity(0.2)
                    .ignoresSafeArea(.all)
                    

                    if viewModel.isLoading {
                        ProgressView()
                    }
                    else if !viewModel.errorMessage.isEmpty {
                        ErrorView(errorDescription: viewModel.errorMessage) {
                            viewModel.reloadProdcut()
                        }
                    }
                    else {
                                
                        VStack(alignment: .leading){
                            SegmentedPickerView(selectedFilterItem: $viewModel.selectedFilterItem)
                                .padding(.horizontal)
                            
                            List {
                                
                                HeaderView(header: viewModel.productsData.header)
                                
                                ForEach(viewModel.productsData.products) { product in
                       
                                    
                                        ProductRowView(product: product)
                                    
                                        .listRowSeparatorTint(.clear)
                                        .listRowBackground(Color.white.opacity(0.2))
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)) // Adjust the insets
                                    

                                        .background(NavigationLink("", destination: {
                                            DetailsView(viewModel: ProductDetailsViewModel(details: product)) { updatedProduct in
                                                viewModel.markAsFavouriteUnfavourite(updatedProduct: updatedProduct)
                                            }

                                        }))
                                                    
                                }
                                    
                                    
                                }
                            .padding(.top, 10)
                            Link("Ⓒ 2016 Check24", destination: URL(string: "https://www.check24.de/popup/datenschutz-check24-gmbh/")!)
                                    // I forgot the exact link
                                    .foregroundColor(.blue)
                                    .italic()
                                    .padding(.horizontal)
                            }
                            .navigationTitle("Products")
                            .navigationBarTitleDisplayMode(.inline)
                            .listStyle(.plain)

                        }

                }
                    
          }
                
      }
        }

                                                            


struct HeaderView: View {
    let header: Header
    
    var body: some View {

        VStack(alignment:.leading, spacing: 10){
            Text(header.headerTitle)
                .fontWeight(.semibold)
            Text(header.headerDescription)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
        

    }
}

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        
        ZStack {
            if product.isFavorite ?? false {
                Color(hex: "#D1C4E9")
            }
            
            if product.available == true {
                AvailableProductView(product: product)
                    .padding(.all)
            } else {
                UnavailableProductView(product: product)
                    .padding(.all)

            }
            
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
                    Spacer()
                    Text(product.releaseDate.toDateFormatted(withFormat: Constant.DateFormat.dd_mm_yyyy))
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack{
                    Text("Preis:")
                        .fontWeight(.semibold)
                    Text(product.price.value.description)
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text(product.price.currency)
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Spacer()
                    RatingView(rating: product.rating.roundedDownToNearestHalf())
                }
            }
        }
    }
}

private struct UnavailableProductView: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 12) {
                Text(product.name)
                    .font(.headline)
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
                     .frame(maxWidth: 40, maxHeight: 40)
            case .failure:
                Image(systemName: "photo")
                    .frame(maxWidth: 40, maxHeight: 40)
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


