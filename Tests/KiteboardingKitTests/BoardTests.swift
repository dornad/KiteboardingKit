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
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.beginner
        XCTAssertEqual(result.length, 183)
        XCTAssertEqual(result.width, 48.4)
        XCTAssertEqual(result.area, 7829.1)
    }
    
    func testLightWindBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.lightWind
        XCTAssertEqual(result.length, 161.4)
        XCTAssertEqual(result.width, 48.4)
        XCTAssertEqual(result.area, 7820)
    }
    
    func testNormalWindBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.normalWind
        XCTAssertEqual(result.length, 150.7)
        XCTAssertEqual(result.width, 44.5)
        XCTAssertEqual(result.area, 6031.7)
    }
    
    func testHardWindBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.hardWind
        XCTAssertEqual(result.length, 137.8)
        XCTAssertEqual(result.width, 40.9)
        XCTAssertEqual(result.area, 5071.8)
    }
}
