//
//  SocialCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/17/23.
//


import Foundation
import ComposableArchitecture
import Dependencies
import Alamofire

struct SocialCore: Reducer {
    
    struct SocialState: Equatable {
        var serchUserId: String = ""

    }
    
    enum SocialAction: Equatable {
        case getSerchArrayList
    }
    
    func reduce(into state: inout SocialState, action: SocialAction) -> Effect<SocialAction> {
        switch action {
        case .getSerchArrayList:
            
//            Requests.request("\(api)/api/user/random/list", .get, params: ["limit" : 15], [SerchListInfo]) { response in
//                
//            }
//            let serchArray: [SerchListArray] = [
//                SerchListArray(
//                    serchListInfo: [
//                        SerchListInfo(rank: 1, image: "Sihun", name: "최시훈",groupName: "대구소프트웨어마이스터고등학교"),
//                        SerchListInfo(rank: 2, image: "Juwan", name: "황주완",groupName: "대구소프트웨어마이스터고등학교"),
//                        SerchListInfo(rank: 3, image: "Hyeseong", name: "이혜성",groupName: "대구소프트웨어마이스터고등학교"),
//                        SerchListInfo(rank: 4, image: "Euigeun", name: "성의근",groupName: "대구소프트웨어마이스터고등학교"),
//                        SerchListInfo(rank: 5, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 6, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 7, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 8, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 9, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 10, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 11, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 12, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 13, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 14, image: "person.fill.questionmark", name: "null", groupName: "null"),
//                        SerchListInfo(rank: 15, image: "person.fill.questionmark", name: "null", groupName: "null")])
//            ]
            return .none
            
        }
    }
}

