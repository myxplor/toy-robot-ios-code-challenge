//
//  RobotView.swift
//  ToyRobot
//
//  Created by Pete Li on 2/8/2022.
//

import SwiftUI

struct RobotView: View {
    @EnvironmentObject var vm: RobotViewModel

    @State private var inputing = ""

    var body: some View {
        VStack {
            TextEditor(text: $inputing)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke()
                )

            Text("Output: \(vm.output)")

            Button("Send", action: {
                vm.sendInput(inputing)
            })
        }
        .padding()
    }
}

struct RobotView_Previews: PreviewProvider {
    static var previews: some View {
        RobotView()
    }
}
