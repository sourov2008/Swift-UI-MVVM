//
//  DetailsUIView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 13/8/23.
//

import SwiftUI

struct DetailsUIView: View {
    
    var product: Product
    
    var body: some View {
        Text(product.name)
    }
}

 
struct DetailsUIView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ProductDummyModel.product
        return DetailsUIView(product: data.products[0])
    }
}

