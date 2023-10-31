//
//  KiteSize.swift
//
//
//  Created by Daniel Rodriguez on 10/26/23.
//

import Foundation

/// A measurement (in m2) of the size of the kite
public typealias KiteSize = Double

/// Represents the ideal, minimum, and maximum sizes for a kite.
public struct KiteSizeRange {
    /// The ideal size (in square meters) of the kite based on wind speed and (rider) weight.
    public let ideal: KiteSize
    /// The minimum size (in square meters) of the kite based on wind speed and (rider) weight.
    ///
    /// You can consider this the "lower" bound of the Kite Range
    public let minimum: KiteSize
    /// The maximum size (in square meters)  of the kite based on wind speed and (rider) weight.
    ///
    /// You can consider this the "upper" bound of the Kite Range
    public let maximum: KiteSize
}
