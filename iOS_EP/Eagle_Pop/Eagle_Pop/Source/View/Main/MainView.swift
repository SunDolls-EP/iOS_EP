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
    
    @State private var isShowingSideSheet = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
            Color("default").ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: {
                
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .imageScale(.large)
                            .font(.headline)
                    }
                    Spacer()
                        .frame(alignment: .topLeading)
                }
                NavigationView {
                    VStack {
                        TimePickerView.build()
                        Menu("주간") {
                            Button("일간", action: self.container.intent.dailyRanking)
                            Button("주간", action: self.container.intent.weeklyRanking)
                            Button("월간", action: self.container.intent.monthlyRanking)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
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


