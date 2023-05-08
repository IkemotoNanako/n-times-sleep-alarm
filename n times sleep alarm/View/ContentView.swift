//
//  ContentView.swift
//  n times sleep alarm
//
//  Created by n.ikemoto on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionDate = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
    let repeatTimes = ["1","2","3","4","5","6","7","8","9","10"]
    @State private var selectedTimes = 0
    @State private var shakeTimes: [ShakeTime] = []
    
    var body: some View {
        VStack {
            DatePicker("目標起床時刻", selection: $selectionDate, displayedComponents: .hourAndMinute)
            HStack{
                Image(systemName: "repeat").font(.largeTitle).padding()
                Picker("繰り返し回数", selection: $selectedTimes) {
                    ForEach(0..<repeatTimes.count) { id in
                        Text(repeatTimes[id]).font(.title)
                    }
                }.onChange(of: selectedTimes) { newValue in
                    generateShakeTimes()
                }
                Spacer()
            }
            List{
                ForEach(shakeTimes) { shakeTime in
                    ShakeTimeView(shakeTime: shakeTime)
                }
            }
            Spacer()
        }
        .padding()
    }
    
    func generateShakeTimes() {
        shakeTimes.removeAll()
        let calendar = Calendar.current
        for i in 0..<selectedTimes + 1 {
            let shakeTime = ShakeTime()
            let time = calendar.date(byAdding: .minute, value: 10 * i, to: selectionDate)!
            let timeComponents = calendar.dateComponents([.hour, .minute], from: time)
            shakeTime.hour = timeComponents.hour!
            shakeTime.minute = timeComponents.minute!
            shakeTime.isOn = true
            shakeTimes.append(shakeTime)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
