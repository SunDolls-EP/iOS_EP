//
//  MainView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import OpenTDS

struct MainView: View {
    
    @StateObject private var container: MainContainer<MainIntent, MainModelStateProtocol>
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let intent = self.container.intent

    var body: some View {
        
        VStack(spacing: 0) {
            
            Button(action: {
                
            }) {
                VStack(spacing: 5) {
                    ForEach(0..<3) { _ in
                        Capsule()
                            .fill(.black)
                            .frame(width: 25, height: 3)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(.white)
            
            VStack(spacing: 18) {
                TimerView.build()
                    .frame(alignment: .center)
                    .padding([.leading, .trailing], 26)
                    .frame(maxHeight: .infinity)
                    .background(.white)
                    .cornerRadius(20)
                
                VStack {
                    Menu("\(container.model.menuTitle)") {
                        Button("일간 랭킹", action: intent.dailyRanking)
                        Button("주간 랭킹", action: intent.weeklyRanking)
                        Button("월간 랭킹", action: intent.monthlyRanking)
                    }
                    .padding(.top, 5)
                    .font(.system(size: 25, weight: .semibold))
                    
                    HStack {
                        Button(action: {
                            // 추후 RankingView로 이동하는 코드 작성
                        }) {
                            ForEach([90, 110, 85], id: \.self) { size in
                                VStack {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .foregroundColor(.pink)
                                        .background(Color.gray)
                                        .frame(width: CGFloat(size), height: CGFloat(size))
                                        .cornerRadius(CGFloat(size) / 2)
                                        .font(.headline)
                                        .frame(width: size != 110 ? 90 : .none)
                                    Text("최시훈")
                                        .font(.custom(helvetica, size: size == 110 ? 30 : 25))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .onAppear(intent.monthlyRanking)
                    }
                }
                .padding([.leading, .trailing], 20)
                .background(.white)
                .cornerRadius(20)
            }
            .padding(20)
        }
        .padding(.bottom, 56)
    }
}

extension MainView {
    static func build() -> some View {
        let model = MainModel()
        let intent = MainIntent(model: model)
        let container = MainContainer(
            intent: intent,
            model: model as MainModelStateProtocol,
            modelChangePublisher: model.objectWillChange)
        return MainView(container: container)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView.build()
    }
}


