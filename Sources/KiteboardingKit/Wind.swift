//
//  Wind.swift
//
//
//  Created by Daniel Rodriguez on 10/26/23.
//

import Foundation

/// Represents the ideal, minimum, and maximum wind speeds for kiteboarding.
public struct WindSpeed {
    /// The ideal wind speed measurement based on factors such as kite size and rider weight.
    public let ideal: Measurement<UnitSpeed>
    /// The minimum wind speed measurement needed for safe kiteboarding.
    public let minimum: Measurement<UnitSpeed>
    /// The maximum wind speed measurement considered safe for kiteboarding.
    public let maximum: Measurement<UnitSpeed>
}
