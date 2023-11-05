//
//  OpenSourceCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import SwiftUI
import ComposableArchitecture

struct OpenSourceCore: Reducer {
    @Dependency(\.sideEffect.openSource) var sideEffect
    
    struct OpenSourceState: Equatable {
    }
    
    enum OpenSourceAction: Equatable {
        case back
        case selectAppInfo(title: String)
    }
    
    
    
    func reduce(into state: inout OpenSourceState, action:OpenSourceAction) -> Effect<OpenSourceAction> {
        switch action {
        case .back:
            sideEffect.routeToBack()
            return .none
        case .selectAppInfo:
            
            return .none
        }
    }
}
