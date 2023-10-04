//
//  MainView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import OpenTDS
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainCore>
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                    ScrollView {
                        VStack(spacing: 18) {
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
                                .padding(.top, 5)
                                .font(.system(size: 25, weight: .semibold))
                                HStack {
                                    Button(action: {
                                        // 추후 RankingView로 이동하는 코드 작성
                                    }) {
                                        let sizes = [90, 110, 85]
                                        let names = ["황주완", "최시훈", "이혜성"]
                                        ForEach(0..<sizes.count, id: \.self) { index in
                                            let size = sizes[index]
                                            let name = names[index]
                                            
                                            VStack {
                                                Image(systemName: "person.fill")
                                                    .resizable()
                                                    .foregroundColor(.gray)
                                                    .background(Color.black)
                                                    .frame(width: CGFloat(size), height: CGFloat(size))
                                                    .cornerRadius(CGFloat(size) / 2)
                                                    .font(.headline)
                                                    .frame(width: size != 110 ? 90 : nil)
                                                
                                                Text(name)
                                                    .font(.custom("pretendardMedium", size: size == 110 ? 30 : 25))
                                                    .foregroundColor(.black)
                                            }
                                            
                                        }
                                        
                                    }
                                    .onAppear() {
                                        
                                    }
                                }
                                .padding(.vertical, 25)
                                .padding(.horizontal, 20)
                                .background(.white)
                                .cornerRadius(20)
                            }
                            .padding(20)
                        }
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity)
                    }
                    .navigationBarTitle(Text("Eagle Pop"), displayMode: .inline)
                    .background(TossColor.background.ignoresSafeArea())
            }
        }
    }
}

#Preview {
        MainView(store: Store(initialState: MainCore.State()) {
            MainCore()
        })
    }
