//
//  RobotCommand.swift
//  ToyRobot
//
//  Created by Pete Li on 1/8/2022.
//

import Foundation

/// A command could consist of an name and param
struct RobotCommand {
    var action: Action

    /// comma seperated e.g. 1,2,NORTH
    var param: String = ""

    init?(_ cmd: String) {
        let cmdComponents = cmd
            .split(separator: " ")
            .map { String($0) }

        guard let actionName = cmdComponents.first else { return nil }

        guard let action = Action(rawValue: actionName.lowercased()) else { return nil }

        self.action = action
        self.param = cmdComponents[safe: 1] ?? ""
    }
}

extension RobotCommand {
    enum Action: String {
        case place(x: Int, y: Int), move, left, right, report
    }
}
