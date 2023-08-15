//
//  ProductsDetailsViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 14/8/23.
//

import Foundation

class ProductDetailsViewModel: ObservableObject {
    
    @Published var details: Product
    
    init(details: Product) {
        self.details = details
    }

    
    func toggleFavorite() {
        if details.isFavorite == nil || details.isFavorite == false{
            details.isFavorite = true
            FavoriteUserDefaults.shared.addFavorite(details)
        }else{
            details.isFavorite = false
            FavoriteUserDefaults.shared.removeFavorite(details)

        }
    }
    
}
