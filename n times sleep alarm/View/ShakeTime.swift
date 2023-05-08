//
//  ShakeTime.swift
//  n times sleep alarm
//
//  Created by n.ikemoto on 2023/05/08.
//
import SwiftUI

struct ShakeTimeView: View {
    @ObservedObject var shakeTime: ShakeTime
    
    var body: some View {
        Toggle(isOn: $shakeTime.isOn) {
            Text(String(format: "%02d:%02d", shakeTime.hour, shakeTime.minute))
                .bold()
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .frame(height: 80.0)
    }
}

struct ShakeTimeView_Previews: PreviewProvider {
    static var previews: some View {
        let shakeTime = ShakeTime()
        shakeTime.hour = 22
        return ShakeTimeView(shakeTime: shakeTime)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
