import XCTest
@testable import KiteboardingKit

final class KiteboardingKitTests: XCTestCase {
    
    var sut: KiteboardingCalculatorType!
    
    override func setUp() {
        super.setUp()
        sut = KiteboardingCalculator()
    }
    
    func testKiteSize() throws {
        let result = sut.kiteSize(weight: .pounds(200), wind: .knots(14))
        XCTAssertEqual(result.ideal, 14.1)
        XCTAssertEqual(result.maximum, 21.2)
        XCTAssertEqual(result.minimum, 10.6)
    }
    
    func testKiteSizeSI() throws {
        let result = sut.kiteSize(weight: .kilograms(90.909), wind: .kilometersPerHour(26))
        XCTAssertEqual(result.ideal, 14.1)
        XCTAssertEqual(result.maximum, 21.2)
        XCTAssertEqual(result.minimum, 10.6)
    }
}
