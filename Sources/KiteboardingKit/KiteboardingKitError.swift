//
//  KiteboardingKitError.swift
//
//
//  Created by Daniel Rodriguez on 10/28/23.
//

import Foundation

// MARK: - KiteboardingCalculatorError

/// Defines the errors that can occur when calculating kiteboarding kit requirements.
public enum KiteboardingKitError: Error {
    /// Error indicating that the wind speed is below 10 knots, making it difficult to kiteboard.
    case difficultToKiteboard
    
    /// Error indicating that the wind speed for trainer kites has exceeded the safe limit of 24 knots.
    case trainerKiteAboveSafeLevel
}
