//
//  TabView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import OpenTDS

struct TabView: View {
    var body: some View {
        
        
        TossTabView {
            MainView.build().tossTabItem("홈", Image(systemName: "house"))

            SocialView().tossTabItem("소셜", Image(systemName: "person.3"))
            
            RankingView.build().tossTabItem("랭킹", Image(systemName: "crown"))
                    
            CalenderView().tossTabItem("캘린더", Image(systemName: "calendar"))
        }
        .ignoresSafeArea(.keyboard)

    }
}
