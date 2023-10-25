//
//  Extensions.swift
//  ToyRobot
//
//  Created by Pete Li on 1/8/2022.
//

import Foundation

extension Collection where Index: StringProtocol {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
