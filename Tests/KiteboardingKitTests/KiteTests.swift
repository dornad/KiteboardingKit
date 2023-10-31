//
//  KiteTests.swift
//
//
//  Created by Daniel Rodriguez on 10/31/23.
//

import XCTest
import KiteboardingKit

final class KiteTests: XCTestCase {
    
    var sut: KiteboardingCalculatorType!
    
    override func setUp() {
        super.setUp()
        sut = KiteboardingCalculator()
    }
    
    func testLearnerKiteSize() throws {
        let result = try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(14))
        XCTAssertEqual(result, 3.4)
    }
    
    func testLearnerKiteSizeInSafeConditions() throws {
        
        XCTAssertEqual(
            try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(24)),
            2.0
        )
        
        XCTAssertThrowsError(
            try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(25))
        ) { error in
            XCTAssertEqual(error as? KiteboardingKitError,
                           KiteboardingKitError.trainerKiteAboveSafeLevel,
                           "Wind Speed for Trainer Kites shouldn’t exceed 24 knots.")
        }
        
        XCTAssertThrowsError(
            try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(26))
        ) { error in
            XCTAssertEqual(error as? KiteboardingKitError,
                           KiteboardingKitError.trainerKiteAboveSafeLevel,
                           "Wind Speed for Trainer Kites shouldn’t exceed 24 knots.")
        }
    }
    
    func testKiteSize() throws {
        let result = sut.kiteSize(weight: .pounds(200),
                                  wind: .knots(14))
        XCTAssertEqual(result.ideal, 14.1)
        XCTAssertEqual(result.maximum, 21.1)
        XCTAssertEqual(result.minimum, 10.6)
    }
    
    func testKiteSizeSI() throws {
        let result = sut.kiteSize(weight: .kilograms(90.7184),
                                  wind: .kilometersPerHour(26))
        XCTAssertEqual(result.ideal, 14.1)
        XCTAssertEqual(result.maximum, 21.1)
        XCTAssertEqual(result.minimum, 10.6)
    }
    
    func testWindSpeed() throws {
        let result = sut.windSpeed(weight: .pounds(200), kiteSize: 14)
        XCTAssertEqual(result.ideal, .knots(14.1))
        XCTAssertEqual(result.maximum, .knots(21.1))
        XCTAssertEqual(result.minimum, .knots(10.6))
    }
    
    func testWindSpeedSI() throws {
        let result = sut.windSpeed(weight: .kilograms(90.7184), kiteSize: 14)
        XCTAssertEqual(result.ideal, .knots(14.1))
        XCTAssertEqual(result.maximum, .knots(21.1))
        XCTAssertEqual(result.minimum, .knots(10.6))
    }
}
