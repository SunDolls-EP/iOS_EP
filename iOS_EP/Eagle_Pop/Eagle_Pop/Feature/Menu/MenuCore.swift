//
//  MenuCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/22.
//

import Foundation
import ComposableArchitecture

struct MenuCore: Reducer {
    struct MenuState: Equatable {
        var memberName: String = "최시훈"
        var menuTitle: String = "이번 주 공부한 시간"
        var studyTime: String = "00:00"
        var affiliated: String = "대구소프트웨어마이스터고등학교"
    }
    
    enum MenuAction: Equatable {
        case getMemberInfo
        case getAffiliated
        case editProfile
        case selectDailyStudyTime
        case selectWeeklyStudyTime
        case selectMonthlyStudyTime
        case saveModifiedInfo
    }
    
    func reduce(into state: inout MenuState, action: MenuAction) -> Effect<MenuAction> {
        switch action {
        case .getMemberInfo:
            
            return .none
        case .getAffiliated:
            
            return .none
            
        case .editProfile:
            
            return .none
            
        case .selectDailyStudyTime:
            state.menuTitle = "오늘 공부한 시간"
            return .none
            
        case .selectWeeklyStudyTime:
            state.menuTitle = "이번 주 공부한 시간"
            return .none
            
        case .selectMonthlyStudyTime:
            state.menuTitle = "이번 달 공부한 시간"
            return .none
        case .saveModifiedInfo:
//            Requests.request(<#T##url: String##String#>, <#T##method: HTTPMethod##HTTPMethod#>, <#T##model: (Decodable & Encodable).Protocol##(Decodable & Encodable).Protocol#>, completion: <#T##(Decodable & Encodable) -> Void#>)
            return .none
        }
    }
}
