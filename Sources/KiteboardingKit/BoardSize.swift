//
//  BoardSize.swift
//
//
//  Created by Daniel Rodriguez on 10/26/23.
//

import Foundation

/// Represents the dimensions of a kiteboarding board.
public struct BoardSize {
    /// The length of the kiteboarding board in cm
    public let length: Double
    /// The width of the kiteboarding board in cm
    public let width: Double
    /// The area of the kiteboarding board calculated based on its length and width.
    public let area: Double
}

/// Provides various board size options for different kiteboarding scenarios.
public struct BoardOptions {
    /// The recommended board size for beginners.
    public let beginner: BoardSize
    /// The recommended board size for light wind conditions.
    public let lightWind: BoardSize
    /// The recommended board size for normal wind conditions.
    public let normalWind: BoardSize
    /// The recommended board size for strong wind conditions.
    public let hardWind: BoardSize
}
