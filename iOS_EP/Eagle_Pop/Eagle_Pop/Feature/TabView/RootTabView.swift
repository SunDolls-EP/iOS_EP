//
//  RootTabView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import ComposableArchitecture
import LinkNavigator
import OpenTDS

struct RootTabView: View {
    
    @State var selection: Int = 0
    var navigator: LinkNavigatorType
    
    var body: some View {
        let mainView = MainView(selection: $selection, store: Store(initialState: MainCore.MainState()) {
            MainCore()})
        
        let socialView = SocialView(store: Store(initialState: SocialCore.State()) {
            SocialCore()})
        
        let rankingView = RankingView(store: Store(initialState: RankingCore.State()) {
            RankingCore()})
        
        let menuView = MenuView(store: Store(initialState:  MenuCore.State()) {
            MenuCore()})
        TossTabView(selection: $selection) {
            
            mainView.tossTabItem("홈", Image(systemName: "house"))
            
            socialView.tossTabItem("소셜", Image(systemName: "person.3"))
            
            rankingView.tossTabItem("랭킹", Image(systemName: "crown"))
            
            menuView.tossTabItem("매뉴", Image(systemName: "line.3.horizontal"))
        }
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(.keyboard)
    }
}

