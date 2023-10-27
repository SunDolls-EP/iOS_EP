//
//  OpenSourceCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import SwiftUI
import ComposableArchitecture

struct OpenSourceCore: Reducer {
    @Dependency(\.sideEffect.openSource) var openSource
    
    struct OpenSourceState: Equatable {
    }
    
    enum OpenSourceAction: Equatable {
        case selectAppInfo(title: String)
    }
    
    
    
    func reduce(into state: inout OpenSourceState, action:OpenSourceAction) -> Effect<OpenSourceAction> {
        switch action {
        case .selectAppInfo:
            return .none
        }
    }
}
