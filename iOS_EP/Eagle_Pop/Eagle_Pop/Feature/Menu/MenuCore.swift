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
        var studyTime: String = "13,833"
        var affiliated: String = "대구소프트웨어마이스터고등학교"
    }
    
    enum MenuAction: Equatable {
        case getMemberInfo
        case getAffiliated
        case editProfile
        case totalStudyTime
        case selectDailyStudyTime
        case selectWeeklyStudyTime
        case selectMonthlyStudyTime
        case saveModifiedInfo
    }
    
    @Dependency(\.sideEffect.menu) var sideEffect
    
    func reduce(into state: inout MenuState, action: MenuAction) -> Effect<MenuAction> {
        var state = state
        switch action {
        case .getMemberInfo:
            
            return .none
        case .getAffiliated:
            
            return .none
            
        case .editProfile:
            sideEffect.routeToEditProfile()
            print("1234")
            return .none
        case .totalStudyTime:
            state.menuTitle = "총 공부한 시간"
//            Requests.simple("\(api)/user/study",
//                .get,
//                params: ["Authorization": "\(Token.get(.accessToken)!)"]) { responseData in
//                let decoder = JSONDecoder()
//                if let data = responseData, let decodedData = try? decoder.decode(StudyTime.self, from: data) {
                    state.studyTime = "0ㄷ"
//                } else {
//                    print("Error decoding data.")
//                }
//            }

            return .none
        case .selectDailyStudyTime:
            state.menuTitle = "오늘 공부한 시간"
//            Requests.simple("\(api)/user/study",
//                .get,
//                params: ["Authorization": "\(Token.get(.accessToken)!)"]) { responseData in
//                let decoder = JSONDecoder()
//                if let data = responseData, let decodedData = try? decoder.decode(StudyTime.self, from: data) {
//                    state.studyTime = "\(decodedData.totalTime)"
//                } else {
//                    print("Error decoding data.")
//                }
//            }

            return .none
            
        case .selectWeeklyStudyTime:
            state.menuTitle = "이번 주 공부한 시간"
//            Requests.simple("\(api)/user/study", 
//                .get,
//                params: ["Authorization": "\(Token.get(.accessToken)!)"]) { responseData in
//                let decoder = JSONDecoder()
//                if let data = responseData, let decodedData = try? decoder.decode(StudyTime.self, from: data) {
//                    state.studyTime = "\(decodedData.totalTime)"
//                } else {
//                    print("Error decoding data.")
//                }
//            }
            return .none
            
        case .selectMonthlyStudyTime:
            state.menuTitle = "이번 달 공부한 시간"
            Requests.simple("\(api)/user/study",
                .get,
                params: ["Authorization": "\(Token.get(.accessToken)!)"]) { responseData in
                let decoder = JSONDecoder()
                if let data = responseData, let decodedData = try? decoder.decode(StudyTime.self, from: data) {
                    state.studyTime = "\(decodedData.totalTime)"
                } else {
                    print("예기치 못한 오류")
                }
            }

            return .none
        case .saveModifiedInfo:
            
            return .none
        }
    }
}
