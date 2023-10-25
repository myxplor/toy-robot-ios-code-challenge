//
//  Robot.swift
//  ToyRobot
//
//  Created by Pete Li on 1/8/2022.
//

import CoreGraphics

/// Model Robot
struct Robot {
    var origin: CGPoint
    var direction: Direction

    /// describe Robot in a readable string
    var description: String {
        "\(Int(origin.x)),\(Int(origin.y)),\(direction.toString.uppercased())"
    }
}

extension Robot {
    enum Direction: Int, CaseIterable {
        case north, west, south, east

        var toString: String {
            String(describing: self)
        }

        /// Construct Direction from a given string
        /// Input: Direction string, could be upper case, lower case, or mixed
        /// Output: Return nil if not found otherwise return coresponding direction
        init?(_ str: String) {
            let foundCase = Self.allCases.first { $0.toString == str.lowercased() }
            guard foundCase != nil else { return nil }

            self = foundCase!
        }

        /// Get the left direction
        func leftDirection() -> Direction? {
            var dirValue = self.rawValue + 1
            if dirValue >= Self.allCases.count {
                dirValue = 0
            }

            return Direction(rawValue: dirValue)
        }

        /// Get the right direction
        func rightDirection() -> Direction? {
            var dirValue = self.rawValue - 1
            if dirValue < 0 {
                dirValue = Self.allCases.last!.rawValue
            }

            return Direction(rawValue: dirValue)
        }
    }
}
