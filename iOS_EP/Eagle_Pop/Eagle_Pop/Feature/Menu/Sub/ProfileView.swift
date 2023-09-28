//
//  ProfileView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/22.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    let store: StoreOf<MenuCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .center)
                    .cornerRadius(20)
                
                VStack {
                    HStack {
                        Text("회원정보")
                            .frame(alignment: .topLeading)
                            .font(.custom(pretendardBold, size: 22))
                            .onAppear(perform: {
                                viewStore.send(.getMemberInfo)
                            })
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("회원정보 수정 \(Image(systemName: "chevron.right"))")
                                .foregroundColor(.gray)
                                .font(.custom(pretendardMedium, size: 14))
                        })
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Image(systemName: "person.fill") //프로필 사진
                            .resizable()
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .font(.headline)
                            .frame(width: 60, height: 60)
                            .frame(alignment: .leading)
                            .cornerRadius(30)
                        Text(viewStore.memberName) // 이름
                            .font(.custom(pretendardSemiBold, size: 24))
                            .padding(.top, 10)
                        Spacer()
                        
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Text("소속")
                            .font(.custom(pretendardMedium, size: 18))
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                        
                        Text(viewStore.affiliated)
                            .font(.custom(pretendardMedium, size: 18))
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    
                    HStack {
                        Menu(viewStore.menuTitle) {
                            Button("오늘 공부한 시간") { viewStore.send(.selectDailyStudyTime) }
                            Button("이번 주 공부한 시간") { viewStore.send(.selectWeeklyStudyTime) }
                            Button("이번 달 공부한 시간") { viewStore.send(.selectMonthlyStudyTime) }
                        }
                        .font(.custom(pretendardMedium, size: 18))
                        .foregroundColor(.gray)
                        .animation(.none)
                        .padding(.leading, 5)
                        
                        Text(viewStore.studyTime)
                            .font(.custom(pretendardMedium, size: 18))
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 20)
            .padding(.horizontal)
            .frame(height: 240, alignment: .top)
        }
    }
}
