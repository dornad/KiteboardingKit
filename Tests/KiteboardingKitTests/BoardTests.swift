//
//  BoardTests.swift
//  
//
//  Created by Daniel Rodriguez on 10/31/23.
//

import XCTest
import KiteboardingKit

final class BoardTests: XCTestCase {
    
    var sut: KiteboardingCalculatorType!
    
    override func setUp() {
        super.setUp()
        sut = KiteboardingCalculator()
    }
    
    func testBeginnerBoard() throws {
        let result = sut.beginnerBoardSize(weight: .pounds(200))
        XCTAssertEqual(result.length, 183)
        XCTAssertEqual(result.width, 48)
        XCTAssertEqual(result.area, 7829)
    }
}
