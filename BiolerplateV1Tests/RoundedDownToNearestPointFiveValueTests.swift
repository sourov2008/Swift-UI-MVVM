//
//  RoundedDownToNearestValue.swift
//  BiolerplateV1Tests
//
//  Created by Shourob Datta on 17/8/23.
//

import Foundation

import XCTest
@testable import BiolerplateV1

final class RoundedDownToNearestPointFiveValueTests: XCTestCase {

    func RoundDownDoubleValue() async {
        
        var doubleValue = 4.30
        var roundedValue = doubleValue.roundedDownToNearestHalf()
        XCTAssertEqual(roundedValue, 4, "Rounded Down To Nearest Point Five Value Failed")
     
        
        doubleValue = 0.30
        roundedValue = doubleValue.roundedDownToNearestHalf()
        XCTAssertEqual(roundedValue, 0, "Rounded Down To Nearest Point Five Value Failed")

        doubleValue = 0.60
        roundedValue = doubleValue.roundedDownToNearestHalf()
        XCTAssertEqual(roundedValue, 0.5, "Rounded Down To Nearest Point Five Value Failed")

        doubleValue = 0.30
        roundedValue = doubleValue.roundedDownToNearestHalf()
        XCTAssertNotEqual(roundedValue, 0.1, "Rounded Down To Nearest Point Five Value Failed")

    }
}
