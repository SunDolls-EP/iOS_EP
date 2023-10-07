//
//  MainCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/20.
//

import Foundation
import ComposableArchitecture
import AVFAudio

struct MainCore: Reducer {
    
    var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    struct MainState: Equatable {
        var paths: [String] = []
        var message = ""
        var menuTitle: String = "주간 랭킹"
        
    }
    
    enum MainAction: Equatable {
        case selectDaily
        case selectWeekly
        case selectMonthly
        // MARK: - TimerView
        case soundPlay
    }
    
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
        case .soundPlay:
            
            return .none
        }
    }
}
