import XCTest
@testable import KiteboardingKit

final class KiteboardingKitTests: XCTestCase {
    
    var sut: KiteboardingCalculatorType!
    
    override func setUp() {
        super.setUp()
        sut = KiteboardingCalculator()
    }
    
    func testTrainerKite() throws {
        let result = sut.calculateTrainer()
        XCTAssertEqual(result.speed.ideal, nil)
        XCTAssertEqual(result.speed.maximum, 10)
        XCTAssertEqual(result.speed.minimum, 24)
        
        XCTAssertEqual(result.board, .init(length: 72, width: 19.1, area: 1213.5))
    }
    
    func testKite() throws {
        let result = sut.calculate(weight: 200)
        XCTAssertEqual(result.speed.ideal, 20)
        XCTAssertEqual(result.speed.maximum, 30)
        XCTAssertEqual(result.speed.minimum, 15)
        
        XCTAssertEqual(result.kiteSize.ideal, 9.9)
        XCTAssertEqual(result.kiteSize.maximum, 14.8)
        XCTAssertEqual(result.kiteSize.minimum, 7.4)
        
        XCTAssertEqual(result.boardOptions.beginner, .init(length: 72, width: 19.1, area: 1213.5))
        XCTAssertEqual(result.boardOptions.lightWind, .init(length: 63.6, width: 19.1, area: 1212.1))
        XCTAssertEqual(result.boardOptions.normalWind, .init(length: 59.3, width: 17.5, area: 934.9))
        XCTAssertEqual(result.boardOptions.hardWind, .init(length: 54.2, width: 16.1, area: 786.1))
    }
}
