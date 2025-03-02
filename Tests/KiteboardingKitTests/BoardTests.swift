//
//  BoardTests.swift
//  
//
//  Created by Daniel Rodriguez on 10/31/23.
//

import Testing
import KiteboardingKit

struct BoardTests {
    var sut: KiteboardingCalculatorType!
    
    init() async throws {
        sut = KiteboardingCalculator()
    }
    
    @Test
    func beginnerBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.beginner
        #expect(result.length == 183)
        #expect(result.width == 48.4)
        #expect(result.area == 7829.1)
    }
    
    @Test
    func lightWindBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.lightWind
        #expect(result.length == 161.4)
        #expect(result.width == 48.4)
        #expect(result.area == 7820)
    }
    
    @Test
    func normalWindBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.normalWind
        #expect(result.length == 150.7)
        #expect(result.width == 44.5)
        #expect(result.area == 6031.7)
    }
    
    @Test
    func hardWindBoard() throws {
        let options = sut.boardSize(weight: .pounds(200))
        let result = options.hardWind
        #expect(result.length == 137.8)
        #expect(result.width == 40.9)
        #expect(result.area == 5071.8)
    }
}
