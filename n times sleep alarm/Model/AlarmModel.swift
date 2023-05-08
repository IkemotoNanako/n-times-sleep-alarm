//
//  AlarmModel.swift
//  n times sleep alarm
//
//  Created by n.ikemoto on 2023/05/09.
//

import Foundation
import UserNotifications
import UIKit

class LocalPushCenter {
    static func sendLocalPush(hour: Int, minute: Int) {
        
        let timeString = String(format: "%02d:%02d", hour, minute)
        let content = UNMutableNotificationContent()
        content.title = "起床時間"
        content.subtitle = "\(timeString)のアラーム"
        content.body = "起きて！"
        content.sound = UNNotificationSound.default // UNNotificationSound(named:) で任意の音を設定可
        
        let component = DateComponents(hour: hour, minute: minute, second: 0, nanosecond: 0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component,
                                                    repeats: false)
        
        let request = UNNotificationRequest(identifier: "TIMER \(timeString)",
                                            content: content,
                                            trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
