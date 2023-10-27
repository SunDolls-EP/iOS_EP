//
//  DeveloperInfoCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import SwiftUI
import ComposableArchitecture

struct DeveloperInfoCore: Reducer {
    @Dependency(\.sideEffect.developerInfo) var developerInfo
    
    struct DeveloperInfoState: Equatable {
    }
    
    enum DeveloperInfoAction: Equatable {
        case selectAppInfo(title: String)
    }
    
    
    
    func reduce(into state: inout DeveloperInfoState, action: DeveloperInfoAction) -> Effect<DeveloperInfoAction> {
        switch action {
        case .selectAppInfo:
            return .none
        }
    }
}
