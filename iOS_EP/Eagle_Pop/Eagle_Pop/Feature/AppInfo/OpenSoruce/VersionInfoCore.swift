//
//  VersionInfoCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import SwiftUI
import ComposableArchitecture

struct VersionInfoCore: Reducer {
    @Dependency(\.sideEffect.versionInfo) var sideEffect
    
    struct VersionInfoState: Equatable {
    }
    
    enum VersionInfoAction: Equatable {
        case back
        case selectAppInfo(title: String)
    }
    
    
    
    func reduce(into state: inout VersionInfoState, action: VersionInfoAction) -> Effect<VersionInfoAction> {
        switch action {
        case .back:
            sideEffect.routeToBack()
            return .none
        case .selectAppInfo:
            return .none
        }
    }
}
