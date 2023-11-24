//
//  TimerView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/04.
//

import SwiftUI
import AVFAudio
import ComposableArchitecture

struct TimerView: View {
    let store: StoreOf<MainCore>
    
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State var selectedTime: Int = 25
    @State var isLabelVisible: Bool = true
    @State var isRunning: Bool = false
    @State var progress: Int = 0
    @State var startTime: Date?
    @State var isPickerVisible: Bool = false
    @State var isPickerHidden: Bool = true
    @State var percentage: CGFloat = 1.0
    @State var player: AVAudioPlayer?
    @State var playingSound: Bool = false
    
    var body: some View {
        
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                CircleProgressView(percentage: percentage)
                    .frame(width: 250, height: 250)
                    .padding()
                VStack {
                    Group {
                        if !isRunning { // 실행 중이 아닐 때 TimePicker 표시
                            CustomTimePickerView(values: Array(25...50), selected: $selectedTime)
                        } else {
                            Text({ () -> String in
                                let time = selectedTime * 60 - progress
                                let minute = (time % 3600) / 60
                                let seconds = time % 60
                                return String(format: "%02d:%02d", minute, seconds)
                            }())
                            .font(.system(size: 28))
                            .foregroundColor(.yellow)
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
                        if playingSound {
                            stopSound()
                            playingSound = false
                        }
                    }) {
                        Image(systemName: isRunning ? "pause" : "play.fill")
                            .font(.headline)
                            .padding()
                            .background(.blue)
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
                    
                    if percentage <= 0 { // 타이머 끝났을 때
                        progress = 0
                        percentage = 1
                        timer.upstream.connect().cancel()
                        
                        playSound()
                        playingSound = true           
                    }
                }
            }
            .onAppear {
                timer.upstream.connect().cancel()
            }
        }
    }
}
extension TimerView {
    func playSound() {
           DispatchQueue.global().async {
               if let soundURL = Bundle.main.url(forResource: "iPhone_Alarm", withExtension: "mp3") {
                   do {
                       player = try AVAudioPlayer(contentsOf: soundURL)
                       player?.play()
                   } catch {
                       print("Error playing sound: \(error.localizedDescription)")
                   }
               }
           }
       }
    func stopSound() {
        player?.stop()
    }
}
