//
//  RankingView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import ComposableArchitecture
import OpenTDS

struct RankingView: View {
    let store: StoreOf<RankingCore>
    
    let data: [Int] = (1...15).map { $0 }
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            NavigationView {
                List {
                    VStack {
                        ZStack {
                            HStack {
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
                                            .font(.headline)
                                            .frame(width: size != 110 ? 90 : nil)
                                        
                                        Text(name)
                                            .font(.custom("pretendardMedium", size: size == 110 ? 30 : 25))
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                                
                            }
                        }
                        .padding(.vertical, 25)
                        .padding(.horizontal, 20)
                        .background(.white)
                        .cornerRadius(20)
                    }
                    .ignoresSafeArea()
                    RankingListView(store: Store(initialState: RankingCore.State()) {
                        RankingCore()
                    })
                }
                .navigationBarTitle("Ranking", displayMode: .large)
                .onAppear {
                    viewStore.send(.getPersonalRankingInfo)
                    viewStore.send(.getGroupRankingInfo)
                }
                .refreshable{
                        viewStore.send(.getPersonalRankingInfo)
                        viewStore.send(.getGroupRankingInfo)
                }
                
            }
            .padding(.horizontal, 0)
            .padding(.bottom, 80)
            .frame(maxHeight: .infinity)
            .ignoresSafeArea(edges: .bottom)
            .background(TossColor.background.ignoresSafeArea())
        }
    }
}


#Preview {
    RankingView(store: Store(initialState: RankingCore.State()) {
        RankingCore()
    })
}
