//
//  ColorExtension.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 16/8/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        var sanitizedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        sanitizedHex = sanitizedHex.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: sanitizedHex).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(
            .sRGB,
            red: red,
            green: green,
            blue: blue,
            opacity: 1
        )
    }
}
