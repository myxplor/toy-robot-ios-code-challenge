//
//  ToyRobotTests.swift
//  ToyRobotTests
//
//  Created by Pete Li on 1/8/2022.
//

import XCTest
@testable import ToyRobot

class ToyRobotTests: XCTestCase {
    func testCommands() throws {
        sampleCommands.forEach { $0.run() }
    }
}

extension ToyRobotTests {
    struct TestCommand {
        /// a set of command strings
        var cmds: [String]

        /// expecting output
        var output: String

        func run() {
            do {
                let interactor = RobotInteractor()
                try interactor.applyCommands(cmds)
                XCTAssertTrue(output == interactor.log, output)

            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    }
}

extension ToyRobotTests {
    private var sampleCommands: [TestCommand] {
        [
            TestCommand(cmds: [
                "PLACE 0,0,NORTH",
                "MOVE",
                "REPORT"
            ], output: "0,1,NORTH"),
            TestCommand(cmds: [
                "PLACE 0,0,NORTH",
                "LEFT",
                "REPORT"
            ], output: "0,0,WEST"),
            TestCommand(cmds: [
                "PLACE 1,2,EAST",
                "MOVE",
                "MOVE",
                "LEFT",
                "MOVE",
                "REPORT"
            ], output: "3,3,NORTH"),
            TestCommand(cmds: [
                "PLACE -1,0,NORTH",
                "REPORT"
            ], output: ""),
            TestCommand(cmds: [
                "PLACE 5,0,NORTH",
                "REPORT"
            ], output: ""),
            TestCommand(cmds: [
                "PLACE 4,0,EAST",
                "MOVE",
                "REPORT"
            ], output: "4,0,EAST"),
            TestCommand(cmds: [
                "MOVE",
                "REPORT",
                "LEFT",
                "RIGHT",
                "PLACE 1,2,EAST",
                "RIGHT",
                "REPORT"
            ], output: "1,2,SOUTH")
        ]
    }

}
