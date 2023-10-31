//
//  KiteboardingKit.swift
//
//
//  Created by Daniel Rodriguez on 10/26/23.
//

import Foundation

// MARK: - KiteboardingCalculatorType

/// A protocol that defines the requirements for a Kiteboarding calculator.
///
/// It provides methods to calculate the appropriate kite size, wind speed, and board size based on the user's weight and/or wind conditions.
public protocol KiteboardingCalculatorType {
    
    /// Calculates the appropriate learner kite size based on the user's weight and current wind speed.
    ///
    /// The default implementation, `KiteboardingCalculator`, will take care of translating
    /// the values you provide into the correct `Mass` and `Speed` units
    ///
    /// - Parameters:
    ///   - weight: The weight of the user in some unit of mass.
    ///   - wind: The wind speed in some unit of speed.
    ///
    /// - Returns: The recommended `KiteSize` for a learner kite.
    ///
    /// - Throws: `KiteboardingKitError` if the wind speed is  too high for safe kiteboarding with a learner kite
    func trainerKiteSize(weight: Measurement<UnitMass>,
                         wind: Measurement<UnitSpeed>) throws -> KiteSize
    
    /// Calculates the recommended kite size based on the user's weight and wind speed.
    ///
    /// The default implementation, `KiteboardingCalculator`, will take care of translating
    /// the values you provide into the correct `Mass` and `Speed` units
    ///
    /// ## Usage
    /// ```
    /// let kiteSize = sut.kiteSize(weight: .pounds(200), wind: .knots(14))
    /// print(kiteSize.ideal) // will print 14.1
    /// ```
    ///
    /// - Parameters:
    ///   - weight: The weight of the user in some unit of mass.
    ///   - wind: The wind speed in some unit of speed.
    /// - Returns: A `KiteSizeRange` object representing the recommended kite size.
    func kiteSize(weight: Measurement<UnitMass>, wind: Measurement<UnitSpeed>) -> KiteSizeRange
    
    /// Calculates the recommended wind speed for kiteboarding based on the user's weight and kite size.
    ///
    /// The default implementation, `KiteboardingCalculator`, will take care of translating
    /// the values you provide into the correct `Mass` and `Speed` units
    ///
    /// - Parameters:
    ///   - weight: The weight of the user in some unit of mass.
    ///   - kiteSize: The size of the kite in square meters.
    /// - Returns: A `WindSpeed` object representing the recommended wind speed.
    func windSpeed(weight: Measurement<UnitMass>, kiteSize: Double) -> WindSpeed
    
    /// Calculates the board size options based on the user's weight.
    ///
    /// The default implementation, `KiteboardingCalculator`, will take care of translating
    /// the values you provide into the correct `Mass` units
    ///
    /// - Parameter weight: The weight of the user in some unit of mass.
    /// - Returns: A `BoardOptions` object representing the recommended board options for beginner, light, normal and heavy wind.
    func boardSize(weight: Measurement<UnitMass>) -> BoardOptions
}

// MARK: - KiteboardingCalculator

public struct KiteboardingCalculator: KiteboardingCalculatorType {
    
    public init() {
        // NO-OP
    }
    
    public func trainerKiteSize(
        weight: Measurement<UnitMass>,
        wind: Measurement<UnitSpeed>
    ) throws -> KiteSize {
        // Convert weight to kilograms
        let weightInKilograms = switch weight.unit {
            case .kilograms: weight.value
            default: weight.converted(to: .kilograms).value
        }
        // Convert wind speed to knots
        let windSpeedInKnots: Int = switch wind.unit {
            case .knots: Int(wind.value)
            default: Int(wind.converted(to: .knots).value)
        }
        
        // calculate the kite size, taking into account the lower
        // and upper bounds for safety.
        let kiteSize: KiteSize = switch windSpeedInKnots {
            case Int.min ..< 10: 4.7
            case 11 ... 24: (0.52 * weightInKilograms) / Double(windSpeedInKnots)
            default: throw KiteboardingKitError.trainerKiteAboveSafeLevel
        }
        
        let roundedSize = (kiteSize * 10).rounded() / 10 // Rounded to 1 decimal place
        
        return roundedSize
    }
        
    public func kiteSize(
        weight: Measurement<UnitMass>,
        wind: Measurement<UnitSpeed>
    ) -> KiteSizeRange {
        // Convert weight to kilograms
        let weightInKilograms = switch weight.unit {
            case .kilograms: weight.value
            default: weight.converted(to: .kilograms).value
        }
        // Convert wind speed to knots
        let windSpeedInKnots: Int = switch wind.unit {
            case .knots: Int(wind.value)
            default: Int(wind.converted(to: .knots).value)
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
    
    public func windSpeed(
        weight: Measurement<UnitMass>,
        kiteSize: Double
    ) -> WindSpeed {
        // Convert weight to kilograms
        let weightInKilograms = switch weight.unit {
            case .kilograms: weight.value
            default: weight.converted(to: .kilograms).value
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
    
    public func boardSize(weight: Measurement<UnitMass>) -> BoardOptions {
        // Convert weight to kilograms
        let weightInKilograms = switch weight.unit {
            case .kilograms: weight.value
            default: weight.converted(to: .kilograms).value
        }
        
        return .init(
            beginner: boardSize(lengthModifier: 40.72, widthModifier: 10.78, areaModifier: 0.8834, weight: weightInKilograms),
            lightWind: boardSize(lengthModifier: 35.93, widthModifier: 10.78, areaModifier: 1.0, weight: weightInKilograms),
            normalWind: boardSize(lengthModifier: 33.53, widthModifier: 9.9, areaModifier: 0.9, weight: weightInKilograms),
            hardWind: boardSize(lengthModifier: 30.66, widthModifier: 9.1036, areaModifier: 0.9, weight: weightInKilograms)
        )
    }
    
    private func boardSize(
        lengthModifier: Double,
        widthModifier: Double,
        areaModifier: Double,
        weight: Double
    ) -> BoardSize {
        let length = lengthModifier * pow(weight, 1.0 / 3.0)
        let roundedLength = (length * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let width = widthModifier * pow(weight, 1.0 / 3.0)
        let roundedWidth = (width * 10).rounded() / 10 // Rounded to 1 decimal place
        
        let area = length * width * areaModifier
        let roundedArea = (area * 10).rounded() / 10 // Rounded to 1 decimal place
        
        return .init(length: roundedLength,
                     width: roundedWidth,
                     area: roundedArea)
    }
}
