//
//  ShakeTimeModel.swift
//  n times sleep alarm
//
//  Created by n.ikemoto on 2023/05/08.
//

import Foundation
import SwiftUI

class ShakeTime: ObservableObject, Identifiable {
    var hour = 8
    var minute = 0
    var isOn = true {
        didSet {
            if isOn {
                LocalPushCenter.sendLocalPush(hour: hour, minute: minute)
            }
        }
    }
}
