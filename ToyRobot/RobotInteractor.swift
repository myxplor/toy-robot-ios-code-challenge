//
//  RobotInteractor.swift
//  ToyRobot
//
//  Created by Pete Li on 1/8/2022.
//

import CoreGraphics

/// Interactor
/// 1. Translate command from string to RobotCommand
/// 2. Apply RobotCommand to model robot
class RobotInteractor {
    /// nil if not on the table, construct at the 1st valid place command
    private var robot: Robot?
    private let tableSize: CGSize

    private(set) var log: String = ""

    /// Robot is not on the table by default
    init(tableSize: CGSize = CGSize(width: 5, height: 5)) {
        self.robot = nil
        self.tableSize = tableSize
    }

    func applyCommands(_ cmds: [String]) throws {
        try cmds.forEach(applyCommand)
    }

    func applyCommand(_ cmd: String) throws {
        guard let robotCommand = RobotCommand(cmd) else {
            throw RobotError.invalidParam
        }

        try applyCommand(robotCommand)
    }

    private func applyCommand(_ cmd: RobotCommand) throws {
        switch cmd.action {
        case .place:
            let cmdParams = cmd.param.split(separator: ",")
            guard cmdParams.count == 3 else {
                throw RobotError.invalidParam
            }

            guard let x = Double(cmdParams[0]), let y = Double(cmdParams[1]),
                  let dir = Robot.Direction(String(cmdParams[2])) else {
                throw RobotError.invalidParam
            }

            try place(at: CGPoint(x: x, y: y), facing: dir)

        case .move:
            try move()

        case .left:
            try left()

        case .right:
            try right()

        case .report:
            report()

        }
    }

    private func place(at origin: CGPoint, facing direction: Robot.Direction? = nil) throws {
        if isOriginValid(origin) {
            if robot == nil {
                robot = Robot(origin: origin, direction: direction ?? .north)

            } else {
                robot!.origin = origin
                robot!.direction = direction ?? robot!.direction
            }

        } else {
            return
        }
    }

    private func move() throws {
        var newOrigin = robot!.origin

        // Assumping south-west is (0, 0)
        switch robot!.direction {
        case .north:
            newOrigin.y += 1
        case .south:
            newOrigin.y -= 1
        case .east:
            newOrigin.x += 1
        case .west:
            newOrigin.x -= 1
        }

        robot!.origin = newOrigin
    }

    private func left() throws {
        guard let newDirection = robot?.direction.leftDirection() else {
            return
        }

        robot!.direction = newDirection
    }

    private func right() throws {
        guard let newDirection = robot?.direction.rightDirection() else {
            return
        }

        robot!.direction = newDirection
    }

    private func report() {
        guard let desc = robot?.description else {
            return
        }

        print(desc)
        log += desc
    }

    private func isOriginValid(_ origin: CGPoint) -> Bool {
        CGRect(origin: .zero, size: tableSize).contains(origin)
    }

    func flush() {
        log.removeAll()
    }
}
