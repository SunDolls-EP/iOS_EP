//
//  DeveloperInfoView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/11/23.
//

import SwiftUI
import ComposableArchitecture

struct DeveloperInfoView: View {
    let store: StoreOf<DeveloperInfoCore>
    let link = "https://www.notion.so/5a1a75035fdf42fcb5837a2697b8a342?pvs=4"
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                ScrollView {
                    Rectangle()
                        .frame(height: 5)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 0)
                        .foregroundColor(Color(UIColor.lightGray))
                    VStack {
                        Text("개발을 즐기는 개발자, 최시훈입니다!")
                            .font(.custom(pretendardBold, size: 25))
                            .padding(.bottom, 30)
                        Group {
                            Text("저는") +
                            Text(" 대구소프트웨어마이스터고등학교 2학년").bold() +
                            Text("에 재학중이며 ") +
                            Text("대소고 최고 미남").bold() +
                            Text("이라는 별명을 가지고 있습니다😎")
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal, 20)
                        
                        Text("제가 더욱 궁굼하시다면 ⬇️ 링크를 눌러주세요")
                            .font(.custom(pretendardLight, size: 20))
                            .padding(.top, 30)
                            .frame(alignment: .leading)
                        Link(destination: URL(string: link)!) {
                            Text(link)
                                .font(.custom(pretendardMedium, size: 10))
                                .foregroundColor(.blue)
                                .underline()
                        }
                        .padding(.top, 5)
                        Spacer()
                            .frame(height: 480)
                        Text("대구소프트웨어마이스터고등학교 Team. Sundolls")
                            .font(.custom(pretendardLight, size: 12))
                            .padding(.trailing, 5)
                            .foregroundColor(Color(UIColor.lightGray))
                            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    }
                }
                .navigationBarTitle(Text("DeveloperInfo"), displayMode: .large)
                    .navigationBarItems(leading: Button {
                        viewStore.send(.back)
                    } label: {
                        Text("\(Image(systemName: "chevron.left")) 뒤로가기")
                    })
            }
        }
    }
}


#Preview {
    DeveloperInfoView(store: Store(initialState:  DeveloperInfoCore.State()) {
        DeveloperInfoCore()})
}
