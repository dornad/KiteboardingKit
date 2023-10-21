// The Swift Programming Language
// https://docs.swift.org/swift-book

struct KiteSize {
    let ideal: Double
    let minimum: Double
    let maximum: Double
}

struct WindSpeedResults {
    let ideal: WindSpeed
    let minimum: WindSpeed
    let maximum: WindSpeed
}

enum KiteType {
    case learner
    case bow
}

enum WindSpeed: Equatable {
    case knots (Double)
    case milesPerHour (Double)
    case kilometersPerHour (Double)
}

enum KiteboarderWeight {
    case pounds (Double)
    case kilograms (Double)
}

protocol KiteboardingCalculatorType {
    func kiteSize(weight: KiteboarderWeight, wind: WindSpeed) -> KiteSize
    func windSpeed(weight: KiteboarderWeight, kiteSize: Double) -> WindSpeedResults
}

struct KiteboardingCalculator: KiteboardingCalculatorType {
        
    func kiteSize(
        weight: KiteboarderWeight,
        wind: WindSpeed
    ) -> KiteSize {
        // Convert weight to kilograms
        let weightInKilograms = switch weight {
            case .pounds(let value): value / 2.2
            case .kilograms(let value): value
        }
        // Convert wind speed to knots
        let windSpeedInKnots: Int = switch wind {
        case .knots(let windSpeed): Int(windSpeed)
        case .milesPerHour(let windSpeed): Int(windSpeed / 1.151)
        case .kilometersPerHour(let windSpeed): Int(windSpeed / 1.852)
        }
        // Calculate kite sizes using original formula
        let ideal = (2.175 * weightInKilograms) / Double(windSpeedInKnots)
        let roundedIdeal = (ideal * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let minimum = 0.75 * (2.175 * weightInKilograms) / Double(windSpeedInKnots)
        let roundedMinimum = (minimum * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let maximum = (1.5 * 2.175 * weightInKilograms) / Double(windSpeedInKnots)
        let roundedMaximum = (maximum * 10).rounded() / 10 // Rounded to 1 decimal place
        
        return .init(ideal: roundedIdeal, minimum: roundedMinimum, maximum: roundedMaximum)
    }
    
    func windSpeed(
        weight: KiteboarderWeight,
        kiteSize: Double
    ) -> WindSpeedResults {
        // Convert weight to kilograms
        let weightInKilograms = switch weight {
            case .pounds(let value): value / 2.2
            case .kilograms(let value): value
        }
        
        // Calculate kite sizes using original formula
        let ideal = (2.175 * weightInKilograms) / kiteSize
        let roundedIdeal = (ideal * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let minimum = 0.75 * (2.175 * weightInKilograms) / kiteSize
        let roundedMinimum = (minimum * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let maximum = (1.5 * 2.175 * weightInKilograms) / kiteSize
        let roundedMaximum = (maximum * 10).rounded() / 10 // Rounded to 1 decimal place
        
        return .init(ideal: .knots(roundedIdeal),
                     minimum: .knots(roundedMinimum),
                     maximum: .knots(roundedMaximum))
    }
}
