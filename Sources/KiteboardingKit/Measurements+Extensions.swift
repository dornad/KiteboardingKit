//
//  Measurements+Extensions.swift
//
//
//  Created by Daniel Rodriguez on 10/26/23.
//

import Foundation

// MARK: - Kilograms and LBS Util Functions

extension Measurement where UnitType == UnitMass {
    /// Creates a Measurement object representing pounds.
    ///
    /// - Parameter value: The numerical value to be represented in pounds.
    /// - Returns: A `Measurement<UnitMass>` object representing the given value in pounds.
    public static func pounds(_ value: Double) -> Measurement<UnitMass> {
        return Measurement(value: value, unit: .pounds)
    }
    
    /// Creates a Measurement object representing kilograms.
    ///
    /// - Parameter value: The numerical value to be represented in kilograms.
    /// - Returns: A `Measurement<UnitMass>` object representing the given value in kilograms.
    public static func kilograms(_ value: Double) -> Measurement<UnitMass> {
        return Measurement(value: value, unit: .kilograms)
    }
}

// MARK: - Knots, MPH, KMP Util Functions

extension Measurement where UnitType == UnitSpeed {
    /// Creates a Measurement object representing knots.
    ///
    /// - Parameter value: The numerical value to be represented in knots.
    /// - Returns: A `Measurement<UnitSpeed>` object representing the given value in knots.
    public static func knots(_ value: Double) -> Measurement<UnitSpeed> {
        return Measurement(value: value, unit: .knots)
    }
    
    /// Creates a Measurement object representing miles per hour.
    ///
    /// - Parameter value: The numerical value to be represented in miles per hour.
    /// - Returns: A `Measurement<UnitSpeed>` object representing the given value in miles per hour.
    public static func milesPerHour(_ value: Double) -> Measurement<UnitSpeed> {
        return Measurement(value: value, unit: .milesPerHour)
    }
    
    /// Creates a Measurement object representing kilometers per hour.
    ///
    /// - Parameter value: The numerical value to be represented in kilometers per hour.
    /// - Returns: A `Measurement<UnitSpeed>` object representing the given value in kilometers per hour.
    public static func kilometersPerHour(_ value: Double) -> Measurement<UnitSpeed> {
        return Measurement(value: value, unit: .kilometersPerHour)
    }
}

