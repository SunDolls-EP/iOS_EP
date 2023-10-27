//
//  RankingListView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/3/23.
//

import SwiftUI
import ComposableArchitecture

struct RankingListView: View {
    let store: StoreOf<RankingCore>
    
    var body: some View {
        
//        WithViewStore(self.store, observe: { $0 }) { viewStore in
//            
//            // MARK: - personal List
//            Section {
//                ForEach(viewStore.personalRankingInfo, id: \.id) { info in
//                    HStack {
//                        Text("\(info.rank).")
//                            .frame(width: 30, alignment: .leading)
//                            .padding(.leading, 20)
//                        if info.rank > 4 {
//                            Image(systemName: info.profileUrl)
//                                .resizable()
//                                .foregroundColor(Color("default"))
//                                .background(Color.gray)
//                                .frame(width: 40, height: 40)
//                                .cornerRadius(20)
//                                .font(.headline)
//                                .padding(.leading, 10)
//                        } else {
//                            Image(info.profileUrl)
//                                .resizable()
//                                .foregroundColor(Color("default"))
//                                .background(Color.gray)
//                                .frame(width: 40, height: 40)
//                                .cornerRadius(20)
//                                .font(.headline)
//                                .padding(.leading, 10)
//                            
//                        }
//                        
//                        VStack(alignment: .leading) {
//                            Spacer()
//                            
//                            HStack {
//                                VStack {
//                                    Text(info.username)
//                                        .font(.custom(pretendardLight, size: 20))
//                                    Text(info.tag)
//                                        .font(.custom(pretendardLight, size: 11))
//                                        .foregroundColor(.gray)
//                                    Text("\(info.totalStudyTime)시간")
//                                        .foregroundColor(.gray)
//                                        .font(.custom(pretendardLight, size: 18))
//                                        .frame(alignment: .leading)
//                                    
//                                }
//                            }
//                            Text(info.schoolName)
//                                .foregroundColor(.gray)
//                                .font(.custom(pretendardMedium, size: 10))
//                            Spacer()
//                        }
//                        .padding(.horizontal, 0)
//                        
//                    }
//                    .padding(.horizontal, 0)
//                    .frame(minHeight: 45)
//                    .listRowInsets(EdgeInsets())
//                }
//            } header: {
//                Text("개인 랭킹")
//                    .font(.custom(pretendardMedium, size: 15))
//                
//                
//            }
//            // MARK: - group List
//            
//            Section {
//                ForEach(viewStore.groupRankingInfo.prefix(15), id: \.id) { info in
//                    HStack {
//                        Text("\(viewStore.rank).")
//                            .frame(width: 30, alignment: .leading)
//                            .padding(.leading, 20)
//                        VStack(alignment: .leading) {
//                            Text("\(info.name ?? "")") // 소속 이름
//                                .font(.system(size: 15))
//                                .frame(alignment: .leading)
//                            Text("\(info.totalStudyTime)시간") // 공부한 시간
//                                .foregroundColor(.gray)
//                                .font(.system(size: 15))
//                                .frame(alignment: .leading)
//                        }
//                    }
//                    .padding(.horizontal, 0)
//                    .frame(minHeight: 45)
//                    .listRowInsets(EdgeInsets())
//                }
//            } header: {
                Text("그룹 랭킹")
                    .font(.custom(pretendardMedium, size: 15))
//            }
//        }
    }
}


