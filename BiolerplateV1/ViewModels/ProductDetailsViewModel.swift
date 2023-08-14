//
//  ProductsDetailsViewModel.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 14/8/23.
//

import Foundation

class ProductDetailsViewModel : ObservableObject{
    
    
    @Published var details: Product
    
    init(details: Product) {
        self.details = details
    }
    
    
}
