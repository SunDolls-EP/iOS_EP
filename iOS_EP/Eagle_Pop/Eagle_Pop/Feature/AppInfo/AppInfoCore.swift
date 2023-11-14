//
//  AppInfoCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/21.
//

import SwiftUI
import ComposableArchitecture

struct AppInfoCore: Reducer {
    @Dependency(\.sideEffect.appInfo) private var sideEffect
    
    struct AppInfoState: Equatable {
    }
    
    enum AppInfoAction: Equatable {
        case selectAppInfo(title: String)
    }
    
    
    
    func reduce(into state: inout AppInfoState, action: AppInfoAction) -> Effect<AppInfoAction> {
        switch action {
        case .selectAppInfo(title: let title):
            switch title {
            case "오픈소스 라이선스":
                sideEffect.routeToOpenSource()

            case "개발자 정보":
                sideEffect.routeToDeveloperInfo()

            case "버전 정보":
                sideEffect.routeToVersionInfo()
            case "로그아웃":
                sideEffect.routeToReset()
            default:
                break
                
            }
            return .none
            
        }
    }
}
