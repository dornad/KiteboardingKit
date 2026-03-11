//
//  KiteTests.swift
//
//
//  Created by Daniel Rodriguez on 10/31/23.
//

import Testing

import KiteboardingKit

struct KiteTests {
    let sut = KiteboardingCalculator()
    
    @Test
    func learnerKiteSize() async throws {
        let result = try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(14))
        #expect(result == 3.4)
    }
    
    @Test
    func LearnerKiteSizeInSafeConditions() throws {
        #expect(
            try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(24)) == 2.0
        )
        
        #expect(throws: KiteboardingKitError.self, "Wind Speed for Trainer Kites shouldn’t exceed 24 knots.") {
            try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(25))
        }
        
        #expect(throws: KiteboardingKitError.self, "Wind Speed for Trainer Kites shouldn’t exceed 24 knots.") {
            try sut.trainerKiteSize(weight: .pounds(200), wind: .knots(25))
        }
    }
    
    @Test
    func kiteSize() throws {
        let result = sut.kiteSize(weight: .pounds(200),
                                  wind: .knots(14))
        #expect(result.ideal == 14.1)
        #expect(result.maximum == 21.1)
        #expect(result.minimum == 10.6)
    }
    
    @Test
    func kiteSizeSI() throws {
        let result = sut.kiteSize(weight: .kilograms(90.7184),
                                  wind: .kilometersPerHour(26))
        #expect(result.ideal == 14.1)
        #expect(result.maximum == 21.1)
        #expect(result.minimum == 10.6)
    }
    
    @Test
    func windSpeed() throws {
        let result = sut.windSpeed(weight: .pounds(200), kiteSize: 14)
        #expect(result.ideal == .knots(14.1))
        #expect(result.maximum == .knots(21.1))
        #expect(result.minimum == .knots(10.6))
    }
    
    @Test
    func windSpeedSI() throws {
        let result = sut.windSpeed(weight: .kilograms(90.7184), kiteSize: 14)
        #expect(result.ideal == .knots(14.1))
        #expect(result.maximum == .knots(21.1))
        #expect(result.minimum == .knots(10.6))
    }
}
