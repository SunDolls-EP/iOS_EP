//
//  RankingListView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/3/23.
//

import SwiftUI

struct RankingListView: View {
    
    var body: some View {
        let personalRankingArray: [PersonalRankingArray] = [
            PersonalRankingArray(title: "개인 랭킹",
                                 personalRankingInfo: [PersonalRankingInfo(rank: 1, image: "Sihun", name: "최시훈", group: "대구소프트웨어마이스터고등학교", studyTime: "1"),
                                                       PersonalRankingInfo(rank: 2, image: "Juwan", name: "황주완", group: "대구소프트웨어마이스터고등학교", studyTime: "1"),
                                                       PersonalRankingInfo(rank: 3, image: "Hyeseong", name: "이혜성", group: "대구소프트웨어마이스터고등학교", studyTime: "1"),
                                                       PersonalRankingInfo(rank: 4, image: "Euigeun", name: "성의근", group: "대구소프트웨어마이스터고등학교", studyTime: "1"),
                                                       PersonalRankingInfo(rank: 5, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 6, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 7, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 8, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 9, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 10, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 11, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 12, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 13, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 14, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null"),
                                                       PersonalRankingInfo(rank: 15, image: "person.fill.questionmark", name: "null", group: "null", studyTime: "null")])
        ]
        let groupRankingArray: [GroupRankingArray] = [
            GroupRankingArray(groupRankingInfo: [GroupRankingInfo(rank: 1, groupName: "대구소프트웨어마이스터고등학교", studyTime: "3"),
                                                 GroupRankingInfo(rank: 2, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 3, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 4, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 5, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 6, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 7, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 8, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 9, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 10, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 11, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 12, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 13, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 14, groupName: "null", studyTime: "null"),
                                                 GroupRankingInfo(rank: 15, groupName: "null", studyTime: "null")])
        ]
        
        // MARK: - personal List
        ForEach(personalRankingArray, id: \.self) { array in
            Section {
                ForEach(array.personalRankingInfo) { info in
                    HStack {
                        Text("\(info.rank).")
                            .frame(width: 30, alignment: .leading)
                            .padding(.leading, 20)
                        if info.rank > 4 {
                            Image(systemName: info.image)
                                .resizable()
                                .foregroundColor(Color("default"))
                                .background(Color.gray)
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .font(.headline)
                                .padding(.leading, 10)
                            
                        } else {
                            Image(info.image)
                                .resizable()
                                .foregroundColor(Color("default"))
                                .background(Color.gray)
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .font(.headline)
                                .padding(.leading, 10)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            
                            HStack {
                                Text(info.name)
                                    .font(.custom(pretendardLight, size: 20))
                                
                                Text("\(info.studyTime)시간")
                                    .foregroundColor(.gray)
                                    .font(.custom(pretendardLight, size: 18))
                                    .frame(alignment: .leading)
                                
                            }
                            Text(info.group)
                                .foregroundColor(.gray)
                                .font(.custom(pretendardMedium, size: 10))
                            Spacer()
                        }
                        .padding(.horizontal, 0)
                        
                    }
                    .padding(.horizontal, 0)
                    .frame(minHeight: 45)
                    .listRowInsets(EdgeInsets())
                }
            } header: {
                Text("\(array.title)")
                    .font(.custom(pretendardMedium, size: 15))
                
            }
        }
        ForEach(groupRankingArray, id: \.self) { array in
            Section {
                ForEach(array.groupRankingInfo) { info in
                    HStack {
                        Text("\(info.rank).")
                            .frame(width: 30, alignment: .leading)
                            .padding(.leading, 20)
                        VStack(alignment: .leading) {
                            Text("\(info.groupName)")//소속 이름
                                .font(.system(size: 15))
                                .frame(alignment: .leading)
                            Text("\(info.studyTime)시간")//공부한 시간
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                                .frame(alignment: .leading)
                        }
                    }
                    .padding(.horizontal, 0)
                    .frame(minHeight: 45)
                    .listRowInsets(EdgeInsets())
                }
            } header: {
                Text("그룹 랭킹")
                    .font(.custom(pretendardMedium, size: 15))
            }
        }
    }
}
