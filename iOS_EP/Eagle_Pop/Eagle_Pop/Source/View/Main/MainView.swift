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
    let store: StoreOf<MainReducer>
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(.white)
            
            VStack(spacing: 18) {
                TimerView()
                    .frame(alignment: .center)
                    .padding([.leading, .trailing], 26)
                    .frame(maxHeight: .infinity)
                    .background(.white)
                    .cornerRadius(20)
                
                VStack {
                    Menu("\(viewStore.menuTitle)") {
                        Button("일간 랭킹") { viewStore.send(.selectDaily)}
                        Button("주간 랭킹") { viewStore.send(.selectWeekly)}
                               Button("월간 랭킹") { viewStore.send(.selectMonthly)}
                    }
                    .padding(.top, 5)
                    //                    .font(.system(size: 25, weight: .semibold))
                    .font(.custom(pretendardThin, size: 20))
                    
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
                                        .font(.custom(pretendardThin, size: size == 110 ? 30 : 25))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .onAppear{
                            for family: String in UIFont.familyNames {
                                print(family)
                                for names : String in UIFont.fontNames(forFamilyName: family){
                                    print("name: \(names)")
                                }
                            }
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: Store(initialState: MainReducer.State()) {
            MainReducer()
        }
        )
    }
}


