//
//  TimePickerContainer.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/11.
//

import SwiftUI
import Combine

final class TimePickerContainer<Intent, Model>: ObservableObject {
    @Published var timePickerModel: TimePickerModel = TimePickerModel()
    
    @State private var selectedTime = 25
    @State private var isRunning = false
    @State private var progress: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State private var percentage = 1.0
    
    let intent: Intent
    let model: Model
    
    private var cancellable: Set<AnyCancellable> = []
    
    
    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
    func isRunnin() {
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
    
}

