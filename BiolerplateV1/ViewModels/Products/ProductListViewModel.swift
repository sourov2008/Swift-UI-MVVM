//
//  PostViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 3/8/23.
//

import Foundation
class ProductListViewModel: ObservableObject {
    
    @Published var productsData: ProductModel
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    private var mainProductData: ProductModel

    @Published var selectedItem: ProductFilterType = .all {
        didSet {
            self.handlePickerSelectionChange()
        }
    }

    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
        self.productsData = ProductModel(header: Header(headerTitle: "", headerDescription: ""), filters: [], products: [])// By initializing make productsData non optional
        self.mainProductData = ProductModel(header: Header(headerTitle: "", headerDescription: ""), filters: [], products: [])

        Task {
            await fetchPosts()
        }
    }
    
    
    @MainActor func fetchPosts() async {
        isLoading = true
        reset()
        let result =  await service.fetchData()
            switch result {
            case .success(let data):
                // Handle the successful case with the productModel
                self.productsData = data
                updateArrayWithSavedFavouriteItems()
                isLoading = false

            case .failure(let error):
                // Handle the APIError in the failure case
                self.errorMessage = "Failed to fetch products: \(error.getErrorMessage())"
                isLoading = false

            }
    }
    
    private func reset(){
        errorMessage = ""
    }
    
    func reloadProdcut()  {
        Task {
            await fetchPosts()
        }
    }
    
    func handlePickerSelectionChange() {
        print("Selected item: \(selectedItem)")
        
        if selectedItem == .all{
            productsData = mainProductData
        }else if selectedItem == .available{
            let filteredItems = mainProductData.products.filter { $0.available }
            productsData.products = filteredItems
        }else if selectedItem == .favourite{
            
            let filteredItems = mainProductData.products.filter { $0.isFavorite ?? false }
//            let filteredItems = mainProductData.products.filter { $0.isFavorite == true }
            productsData.products = filteredItems
        }
    }
    
    private func updateArrayWithSavedFavouriteItems(){
                
        let favorite  = FavoriteUserDefaults.shared.favorites
        for item in favorite {
            if let index = productsData.products.firstIndex(where: { $0.id == item.id }) {
                productsData.products[index] = item
            }
        }
        // keep a copy of main product data
        mainProductData = productsData
        handlePickerSelectionChange()
    }
    
    func markAsFavouriteUnfavourite(_ updatedProduct: Product) {

        guard let mainArrMatchIndex = mainProductData.products.firstIndex(where: { $0.id == updatedProduct.id }) else {
            return
        }
        mainProductData.products[mainArrMatchIndex] = updatedProduct
        handlePickerSelectionChange()

    }
    
}


