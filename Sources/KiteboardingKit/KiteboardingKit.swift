// The Swift Programming Language
// https://docs.swift.org/swift-book

struct KiteSize {
    let ideal: Double
    let minimum: Double
    let maximum: Double
}

struct BoardSize: Equatable {
    let length: Double
    let width: Double
    let area: Double
}

struct BoardOptions {
    let beginner: BoardSize
    let lightWind: BoardSize
    let normalWind: BoardSize
    let hardWind: BoardSize
}

enum KiteType {
    case learner
    case bow
}

enum WindSpeed {
    case knots (Double)
    case milesPerHour (Double)
    case metersPerSecond (Double)
}

enum KiteboarderWeight {
    case pounds (Double)
    case kilograms (Double)
}

protocol KiteboardingCalculatorType {
    func boardSize(weight: KiteboarderWeight) -> BoardSize
    func kiteSize(weight: KiteboarderWeight, wind: WindSpeed) -> KiteSize
}

struct KiteboardingCalculator: KiteboardingCalculatorType {
    
    func boardSize(weight: KiteboarderWeight) -> BoardSize {
        return .init(length: 0, width: 0, area: 0)
    }
    
    func kiteSize(
        weight: KiteboarderWeight,
        wind: WindSpeed
    ) -> KiteSize {
        // Convert weight to pounds
        let weightInKilograms = switch weight {
            case .pounds(let value): value / 2.2
            case .kilograms(let value): value
        }
        // Convert wind speed to knots
        let windSpeedInKnots = switch wind {
        case .knots(let windSpeed): windSpeed
        case .milesPerHour(let windSpeed): windSpeed / 1.151
        case .metersPerSecond(let windSpeed): windSpeed / 1.852
        }
        // Calculate kite sizes using original formula
        let ideal = (2.175 * weightInKilograms) / windSpeedInKnots
        let roundedIdeal = (ideal * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let minimum = 0.75 * (2.175 * weightInKilograms) / windSpeedInKnots
        let roundedMinimum = (minimum * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let maximum = (1.5 * 2.175 * weightInKilograms) / windSpeedInKnots
        let roundedMaximum = (maximum * 10).rounded() / 10 // Rounded to 1 decimal place
        
        return .init(ideal: roundedIdeal, minimum: roundedMinimum, maximum: roundedMaximum)
    }
}
