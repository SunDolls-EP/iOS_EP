//
//  RankingView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI

struct RankingView: View {
    
    var body: some View {
        HStack {
            NavigationView {
                ScrollView {
                    HStack {
                        ForEach([90, 110, 85], id: \.self) { size in
                            VStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .background(.black)
                                    .frame(width: CGFloat(size), height: CGFloat(size))
                                    .cornerRadius(CGFloat(size) / 2)
                                    .font(.headline)
                                    .frame(width: size != 110 ? 90 : .none)
                                Text("최시훈")
                                    .font(.custom(pretendardMedium, size: size == 110 ? 30 : 25))
                                    .foregroundColor(.black)
                            }
                        }
                        .onAppear() {
                            
                        }
                    }
                    .padding(.vertical, 25)
                    .padding(.top, 50)
                }
            }
        }
    }
}

#Preview {
    RankingView()
}
