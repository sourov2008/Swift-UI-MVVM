//
//  DoubleExtension.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 16/8/23.
//

import Foundation

extension Double {
    func roundedDownToNearestHalf() -> Double {
        return Double(Int(self * 2)) / 2.0
    }
}
