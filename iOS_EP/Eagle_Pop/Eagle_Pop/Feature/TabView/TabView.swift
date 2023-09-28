//
//  TabView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import OpenTDS
import ComposableArchitecture

struct TabView: View {
    @State private var tabButton: Int = 0
    var body: some View {
        
        TossTabView {
            MainView(store: Store(initialState: MainCore.State()) {
                MainCore()}).tossTabItem("홈", Image(systemName: "house"))
            
            SocialView().tossTabItem("소셜", Image(systemName: "person.3"))
            
            RankingView().tossTabItem("랭킹", Image(systemName: "crown"))
            
            MenuView(store: Store(initialState:  MenuCore.State()) {
                MenuCore()}).tossTabItem("매뉴", Image(systemName: "line.3.horizontal"))
        }
        .ignoresSafeArea(.keyboard)
    }
}

