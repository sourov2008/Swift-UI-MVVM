//
//  RatingView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 15/8/23.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Image(systemName: self.imageName(for: index))
                    .foregroundColor(.yellow)
            }
        }
    }
    
    private func imageName(for index: Int) -> String {
        let filledCount = Int(rating)
        
        if index < filledCount {
            return "star.fill"
        } else if index == filledCount {
            if rating - Double(filledCount) >= 0.25 {
                return "star.lefthalf.fill"
            } else {
                return "star"
            }
        }
        
        return "star"
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 3.4.roundedDownToNearestHalf())
    }
}
