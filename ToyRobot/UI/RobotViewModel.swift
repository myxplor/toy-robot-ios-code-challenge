//
//  RobotViewModel.swift
//  ToyRobot
//
//  Created by Pete Li on 2/8/2022.
//

import Foundation

class RobotViewModel: ObservableObject {
    @Published var output = ""

    private let interactor = RobotInteractor()

    func sendInput(_ input: String) {
        let cmds = input
            .split(whereSeparator: \.isNewline)
            .map { String($0) }

        interactor.flush()
        self.output = ""

        do {
            try interactor.applyCommands(cmds)
        } catch {
            self.output = "Invalid input"
        }

        self.output = interactor.log
    }
}
