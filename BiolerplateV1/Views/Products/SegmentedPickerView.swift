//
//  PickerView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 16/8/23.
//

import SwiftUI

struct SegmentedPickerView: View {
    @Binding var selectedFilterItem: ProductFilterType
        
    var body: some View {
        VStack {
 
            Picker("", selection: $selectedFilterItem) {
                ForEach(ProductFilterType.allCases, id: \.self) { value in
                    Text(value.rawValue)
                }
            }
            
            .pickerStyle(SegmentedPickerStyle())

        }
    }
}


struct SegmentedPickerView_Previews: PreviewProvider {

    static var previews: some View {
        SegmentedPickerView(selectedFilterItem: .constant(.all))
    }
}
