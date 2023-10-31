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

/// <#Description#>
public struct BoardOptions {
    /// <#Description#>
    public let beginner: BoardSize
    /// <#Description#>
    public let lightWind: BoardSize
    /// <#Description#>
    public let normalWind: BoardSize
    /// <#Description#>
    public let hardWind: BoardSize
}
