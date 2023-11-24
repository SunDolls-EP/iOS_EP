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
                            viewStore.send(.editProfile)
                            
                        }, label: {
                            Text("회원정보 수정 \(Image(systemName: "chevron.right"))")
                                .foregroundColor(.gray)
                                .font(.custom(pretendardMedium, size: 14))
                        })
                    }
                    .padding(.top, 5)
                    
                    HStack {
                            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/a/ACg8ocK1Wvgt-PkiGcwk02KAPlNGMTwMJoyixIcPR5v5lyyA=s96-c")) { image in
                                image.resizable()
                                    .foregroundColor(Color("default"))
                                    .background(Color.gray)
                                    .font(.title)
                                    .frame(width: 60, height: 60)
                                    .frame(alignment: .leading)
                                    .cornerRadius(30)
                            } placeholder: {
                                ProgressView()
                                    .foregroundColor(Color("default"))
                                    .background(Color.gray)
                                    .font(.title)
                                    .frame(width: 60, height: 60)
                                    .frame(alignment: .leading)
                                    .cornerRadius(30)
                            }
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
                            Button("총 공부한 시간") { viewStore.send(.selectDailyStudyTime) }
                            Button("오늘 공부한 시간") { viewStore.send(.selectDailyStudyTime) }
                            Button("이번 주 공부한 시간") { viewStore.send(.selectWeeklyStudyTime) }
                            Button("이번 달 공부한 시간") { viewStore.send(.selectMonthlyStudyTime) }
                        }
                        .font(.custom(pretendardMedium, size: 18))
                        .foregroundColor(.gray)
                        .padding(.leading, 5)
                        
                        Text(viewStore.studyTime)
                            .font(.custom(pretendardMedium, size: 18))
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                .padding(.horizontal, 0)
            }
            .padding(.top, 20)
            .padding(.horizontal, 0)
            .frame(height: 200, alignment: .top)
        }
    }
}
