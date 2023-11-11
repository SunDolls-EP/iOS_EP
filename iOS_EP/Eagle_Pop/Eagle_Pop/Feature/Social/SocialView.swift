//
//  SocialView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import ComposableArchitecture

struct SocialView: View {
    let store: StoreOf<SocialCore>
    
    @State var serchUserId: String = ""
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                List {
                    Section {
                        ZStack {
                            TextField("검색할 회원의 이름과 태그를 입력해주세요", text: $serchUserId)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding(.all, 0)
                            HStack {
                                Spacer()
                                Button {
                                    serchUserId = ""
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    } header: {
                        Text("검색")
                            .font(.custom(pretendardMedium, size: 15))
                        
                    }
                        SocialListView()
                            .frame(alignment: .center)
                }
                .navigationBarTitle(Text("소셜"), displayMode: .large)
                .refreshable{
                    func getSomeData() async {
                        await Task.sleep(3_000_000_000)
                    }
                }
            }
        }
    }
}


#Preview {
    SocialView(store: Store(initialState: SocialCore.State()) { SocialCore() })
}
