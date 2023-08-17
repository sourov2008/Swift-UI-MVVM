//
//  DateExtension.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 16/8/23.
//


import Foundation

extension Int {
    
    func toDateFormatted(withFormat format: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}
