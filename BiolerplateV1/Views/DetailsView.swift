//
//  DetailsUIView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 13/8/23.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var viewModel: ProductDetailsViewModel

    var body: some View {
        Text(viewModel.details.name)
    }
}

 
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ProductDummyModel.product
        return DetailsView(viewModel: ProductDetailsViewModel(details: data.products[0]))
    }
}

