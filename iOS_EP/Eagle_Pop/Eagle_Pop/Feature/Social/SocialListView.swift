//
//  SocialListView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/4/23.
//

import SwiftUI

struct SocialListView: View {
    var body: some View {
        
        
        
        let serchArray: [SerchListArray] = [
            SerchListArray(
                serchListInfo: [
                    SerchListInfo(rank: 1, image: "Sihun", name: "최시훈",groupName: "대구소프트웨어마이스터고등학교"),
                    SerchListInfo(rank: 2, image: "Juwan", name: "황주완",groupName: "대구소프트웨어마이스터고등학교"),
                    SerchListInfo(rank: 3, image: "Hyeseong", name: "이혜성",groupName: "대구소프트웨어마이스터고등학교"),
                    SerchListInfo(rank: 4, image: "Euigeun", name: "성의근",groupName: "대구소프트웨어마이스터고등학교"),
                    SerchListInfo(rank: 5, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 6, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 7, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 8, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 9, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 10, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 11, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 12, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 13, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 14, image: "person.fill.questionmark", name: "null", groupName: "null"),
                    SerchListInfo(rank: 15, image: "person.fill.questionmark", name: "null", groupName: "null")])
        ]
        ForEach(serchArray, id: \.self) { array in
            Section {
                ForEach(array.serchListInfo) { info in
                    HStack {
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
                            HStack {
                                Text("\(info.name)")//이름
                                    .font(.custom(pretendardLight, size: 20))
                                Text("\(info.groupName)")//소속
                                    .foregroundColor(.gray)
                                    .font(.custom(pretendardMedium, size: 10))
                            }
                            .padding(.horizontal, 0)
                            
                        }
                    }
                }
            }
            .frame(minHeight: 50)
            .listRowInsets(EdgeInsets())
        }
    }
}
