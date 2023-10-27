//
//  Kite.swift
//  
//
//  Created by Daniel Rodriguez on 10/26/23.
//

import Foundation

/// Represents the ideal, minimum, and maximum sizes for a kite.
public struct KiteSize {
    /// The ideal size (in square meters) of the kite based on wind speed and (rider) weight.
    public let ideal: Double
    /// The minimum size (in square meters) of the kite based on wind speed and (rider) weight.
    public let minimum: Double
    /// The maximum size (in square meters)  of the kite based on wind speed and (rider) weight.
    public let maximum: Double
}

/// Represents the different types of kites used in kiteboarding.
enum KiteType {
    /// A kite specifically designed for beginners, focused on ease of use and safety.
    case learner    
    /// A more advanced kite design that allows for better upwind performance and higher jumps.
    case bow
}
