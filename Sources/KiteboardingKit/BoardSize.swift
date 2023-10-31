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
    public let length: Int
    /// The width of the kiteboarding board in cm
    public let width: Int
    /// The area of the kiteboarding board calculated based on its length and width.
    public let area: Int
}

/// Represents the ideal, minimum, and maximum sizes for a Board.
public typealias BoardSizeRange = ItemRange<BoardSize>
