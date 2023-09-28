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
                    ScrollView {
                        ProfileView(store: Store(initialState:  MenuCore.State()) {
                            MenuCore()
                        })
                        .padding(.top, -10)

                        Spacer()
                    }
                    .navigationBarTitle(Text("Hello, SwiftUI!"), displayMode: .inline)
                    .background(TossColor.background.ignoresSafeArea())
            }
        }
    }
}

#Preview {
        MenuView(store: Store(initialState:  MenuCore.State()) {
            MenuCore()})
}
