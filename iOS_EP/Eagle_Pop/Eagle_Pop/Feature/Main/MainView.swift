//
//  MainView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import ComposableArchitecture
import OpenTDS

struct MainView: View {
    
    @Binding var selection: Int
    let store: StoreOf<MainCore>
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                ScrollView {
                    VStack(spacing: 15) {
                        TimerView(store: Store(initialState: MainCore.State()) { MainCore() })
                            .frame(alignment: .center)
                            .padding(.top, 26)
                            .padding(.bottom, 26)
                            .padding([.leading, .trailing], 26)
                            .frame(maxHeight: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                        
                        VStack {
                                Menu("\(viewStore.menuTitle)") {
                                    Button("일간 랭킹") { viewStore.send(.selectDaily) }
                                    Button("주간 랭킹") { viewStore.send(.selectWeekly) }
                                    Button("월간 랭킹") { viewStore.send(.selectMonthly) }
                                }
                                .font(.system(size: 25, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                                .frame(alignment: .center)
                            Button(action: {
                                selection = 2
                            }) {
                                let sizes = [90, 110, 85]
                                let names = ["황주완", "최시훈", "이혜성"]
                                let images = ["Juwan", "Sihun", "Hyeseong"]
                                ForEach(0..<sizes.count, id: \.self) { index in
                                    let size = sizes[index]
                                    let name = names[index]
                                    let image = images[index]
                                    VStack {
                                        Image(image)
                                            .resizable()
                                            .foregroundColor(Color("default"))
                                            .background(Color.gray)
                                            .frame(width: CGFloat(size), height: CGFloat(size))
                                            .cornerRadius(CGFloat(size) / 2)
                                            .font(.title)
                                            .frame(width: size != 110 ? 90 : nil)
                                        
                                        Text(name)
                                            .font(.custom("pretendardMedium", size: size == 110 ? 30 : 25))
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 25)

                        }
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.top, 20)
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity)
                }
                .navigationBarTitle(Text("Eagle Pop"), displayMode: .inline)
                .background(Color("background"))
            }
        }
    }
}

#Preview {
    MainView(selection: .constant(0), store: Store(initialState: MainCore.State()) {
        MainCore()
    })
}
