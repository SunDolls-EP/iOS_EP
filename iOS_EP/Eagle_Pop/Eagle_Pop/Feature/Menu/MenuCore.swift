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
        var studyTime: String = "01:53"
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
        case selectAppInfo(title: String)
    }
    
//    @Dependency(\.sideEffect.menu) var sideEffect

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
            
            return .none
        case .selectAppInfo(let title):
            switch title {
            case "오픈소스 라이선스":
                print("오픈소스 라이선스 버튼을 눌렀습니다.")
            case "개발자 정보":
                print("개발자 정보 버튼을 눌렀습니다.")
            case "버전 정보":
                print("버전 정보 버튼을 눌렀습니다.")
            case "로그아웃":
                print("로그아웃 버튼을 눌렀습니다.")
            default:
                break
            }
            return .none
        }
    }
}
