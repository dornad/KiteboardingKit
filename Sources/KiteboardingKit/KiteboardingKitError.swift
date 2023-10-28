//
//  KiteboardingKitError.swift
//
//
//  Created by Daniel Rodriguez on 10/28/23.
//

import Foundation

// MARK: - KiteboardingCalculatorError

/// <#Description#>
public enum KiteboardingKitError: Error {
    /// It is challenging to kite in `<10` knots
    case belowNineKnots
    /// Wind Speed for Trainer Kites shouldn't exceed 24 knots.
    case trainerKiteAboveSafeLevel
}
