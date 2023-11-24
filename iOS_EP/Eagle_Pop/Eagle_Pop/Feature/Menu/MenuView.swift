//
//  MenuView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import ComposableArchitecture
import OpenTDS

struct MenuView: View {
    let store: StoreOf<MenuCore>
    
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                List {
//                    Section {
                        ProfileView(store: Store(initialState:  MenuCore.State()) {
                            MenuCore()
                        })
                        .padding(.top, -10)
                        .padding(.bottom, 20)
//                    }
//                    .onTapGesture{
//                        viewStore.send(.editProfile)
//                    }
                    
                    AppInfoView(store: Store(initialState:  AppInfoCore.State()) {
                        AppInfoCore()
                    })
                }
                .navigationBarTitle(Text("프로필"), displayMode: .large)

                
            }
            .padding(.horizontal, 0)
            .background(TossColor.background.ignoresSafeArea())
            .listStyle(InsetGroupedListStyle())
            
        }
        .padding(.horizontal, 0)
    }
}


#Preview {
    MenuView(store: Store(initialState:  MenuCore.State()) {
        MenuCore()})
}
