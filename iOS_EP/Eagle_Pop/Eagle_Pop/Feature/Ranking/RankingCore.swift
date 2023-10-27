//
//  Ranking.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 9/28/23.
//

import Foundation
import ComposableArchitecture
import Dependencies
import Alamofire

struct RankingCore: Reducer {
    struct RankingState: Equatable {
        var paths: [String] = []
        var message = ""
        var name: String = ""
        var isOn: Bool = false
        var personalRankingInfo: [PersonalRankingInfo] = []
        var groupRankingInfo: [GroupRankingInfo] = []
        var rank = Array(1...15)
    }
    let jsonString = """
[
    {
        "name": "dsklen",
        "totalStudyTime": 10002
    },
    {
        "name": "c",
        "totalStudyTime": 114
    },
    {
        "name": "b",
        "totalStudyTime": 112
    },
    {
        "name": "a",
        "totalStudyTime": 110
    },
    {
        "name": "null",
        "totalStudyTime": 89
    },
    {
        "name": "eothrh",
        "totalStudyTime": 89
    }
    ]
"""
    
    enum RankingAction: Equatable {
        case getPersonalRankingInfo
        case getGroupRankingInfo
        case refrashScroll
    }
    
    func reduce(into state: inout RankingState, action: RankingAction) -> Effect<RankingAction> {
//        var state = state
        switch action {
        case .getPersonalRankingInfo:
//            let url = "\(api)/rank"
            //            Requests.simple(url,
            //                            .get,
            //                            params: ["limit": 15]) { responseData in
            //                let decoder = JSONDecoder()
            //                if let data = jsonString.data(using: .utf8), let decodedData = try? decoder.decode([PersonalRankingInfo].self, from: data) {
            //                    state.personalRankingInfo = decodedData
            //                    print("Success: \(decodedData)")
            //                } else {
            //                    print("Error decoding data.")
            //                }
            //            }
            return .none
        case .getGroupRankingInfo:
//            let url = "\(api)/rank/school/all"
            //            Requests.simple(url,
            //                            .get,
            //                            params: ["limit": 15]) { responseData in
            //                let decoder = JSONDecoder()
            //                if let data = jsonString.data(using: .utf8), let decodedData = try? decoder.decode([GroupRankingInfo].self, from: data) {
            //                    state.groupRankingInfo = decodedData
            //                    print("Success: \(decodedData)")
            //                } else {
            //                    print("Error decoding data.")
            //                }
            ////            }
            if let jsonData = jsonString.data(using: .utf8) {
                do {
                    let studyRecords = try JSONDecoder().decode([GroupRankingInfo].self, from: jsonData)
                    print("\(studyRecords)")
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else {
                print("Failed to convert JSON string to data.")
            }
            return .none
        case .refrashScroll:
            return .none
        }
    }
}



