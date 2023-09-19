//
//  TimerView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/04.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var container: TimerContainer<TimerIntent, TimerModelStateProtocol>
    
    // 상태 변수
    @State private var isLabelVisible = true
    @State private var selectedTime = 25
    @State private var isRunning = false
    @State private var progress: Int = 0
    @State private var startTime: Date?
    @State private var isPickerVisible = false
    @State private var isPickerHidden = true
    @State private var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State private var percentage = 1.0
    
    var body: some View {
        ZStack {
            CircleProgressView(percentage: percentage)
                .frame(width: 250, height: 250)
                .padding()
            VStack {
                Group {
                    if !isRunning { // 실행 중이 아닐 때 TimePicker 표시
                        UITimePickerView(values: Array(20...50), selected: $selectedTime)
                    } else {
                        Text({ () -> String in
                            let time = selectedTime * 60 - progress
                            let minute = (time % 3600) / 60
                            let seconds = time % 60
                            return String(format: "%02d:%02d", minute, seconds)
                        }())
                        .font(.system(size: 28))
                        .foregroundColor(.blue)
                    }
                }
                .frame(width: 200, height: 30)
                Button(action: {
                    if isRunning {
                        progress = 0 // 일시정지할 때 타이머와 진행률 초기화
                        withAnimation(.default) {
                            percentage = 1
                        }
                        timer.upstream.connect().cancel()
                    } else {
                        timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect() // 실행 중이 아닐 때 타이머 시작
                    }
                    isRunning.toggle()
                }) {
                    Image(systemName: isRunning ? "pause" : "play.fill")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(width: 60, height: 60, alignment: .center)
            }
        }
        .onReceive(timer) { _ in
            progress += 1
            withAnimation(.default) {
                let seconds = selectedTime * 60
                let time = seconds - progress
                percentage = CGFloat(time) / CGFloat(seconds)
            }
        }
        .onAppear {
            timer.upstream.connect().cancel()
        }
    }
}
extension TimerView {
    static func build() -> some View {
        let model = TimerModel()
        let intent = TimerIntent(model: model)
        let container = TimerContainer(
            intent: intent,
            model: model as TimerModelStateProtocol,
            modelChangePublisher: model.objectWillChange)
        return TimerView(container: container)
    }
}
