//
//  ItemRange.swift
//
//
//  Created by Daniel Rodriguez on 10/31/23.
//

import Foundation

/// Represents the ideal, minimum, and maximum sizes for an Element
public struct ItemRange<ItemType> {
    /// The ideal size of the element
    public let ideal: ItemType
    /// The lower bound of the element.
    public let minimum: ItemType
    /// the upper bound of the element.
    public let maximum: ItemType
}
