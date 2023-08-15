//
//  FavoriteUserDefaults.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 15/8/23.
//

import Foundation

class FavoriteUserDefaults {
    
    static let shared = FavoriteUserDefaults()
    
    private let favoritesKey = "favorites"
    
     var favorites: [Product] {
        get {
            if let data = UserDefaults.standard.data(forKey: favoritesKey),
               let decodedFavorites = try? JSONDecoder().decode([Product].self, from: data) {
                return decodedFavorites
            }
            return []
        }
        set {
            if let encodedFavorites = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encodedFavorites, forKey: favoritesKey)
            }
        }
    }
    
    func addFavorite(_ product: Product) {
        if !favorites.contains(where: { $0.id == product.id }) {
            favorites.append(product)
        }
    }
    
    func removeFavorite(_ product: Product) {
        favorites.removeAll { $0.id == product.id }
    }

}
