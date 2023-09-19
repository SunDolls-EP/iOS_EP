//
//  MainReducer.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/20.
//

import Foundation
import ComposableArchitecture

struct MainReducer: Reducer {
    
    func reduce(into state: inout MainState, action: MainAction) -> Effect<MainAction> {
        switch action {
        case .selectDaily:
            state.menuTitle = "일간 랭킹"
            return .none

            
        case .selectWeekly:
            state.menuTitle = "주간 랭킹"
            return .none

        case .selectMonthly:
            state.menuTitle = "월간 랭킹"
            return .none
        }
    }
    
}
