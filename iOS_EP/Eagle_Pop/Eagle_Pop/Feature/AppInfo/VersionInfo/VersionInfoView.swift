//
//  VersionInfoView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/11/23.
//

import SwiftUI
import ComposableArchitecture
struct VersionInfoView: View {
    let store: StoreOf<VersionInfoCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in      
            NavigationView {
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 5)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 0)
                            .foregroundColor(Color(UIColor.lightGray))
                        HStack {
                            Text("앱 버전: 0.1.0 베타")
                                .font(.custom(pretendardSemiBold, size: 30))
                                .frame(alignment: .leading)
                                .padding(.leading, 20)
                            Spacer()
                        }
                        .padding(.top, 50)
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
    VersionInfoView(store: Store(initialState:  VersionInfoCore.State()) {
        VersionInfoCore()})
}
