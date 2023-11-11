//
//  SettingCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/11/06.
//

import Foundation
import ComposableArchitecture
import Alamofire
import SwiftUI
import OpenTDS
import LinkNavigator

struct SettingCore: Reducer {
    @Dependency(\.sideEffect.setting) private var sideEffect
    
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
        case back
        case save
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        var state = state
        switch action {
        case .save:
            TimerView(store: Store(initialState: MainCore.State()) { MainCore() })
                .selectedTime = SettingView(store: Store(initialState: SettingCore.State()) { SettingCore() })
                .setStudyTime
            return .none
        case .back:
            sideEffect.routeToBack()
            return .none
        }
        
    }
    // MARK: - func
}
