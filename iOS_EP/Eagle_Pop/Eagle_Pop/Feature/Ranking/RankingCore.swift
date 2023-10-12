//
//  Ranking.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 9/28/23.
//


import Foundation
import ComposableArchitecture
import Dependencies

struct RankingCore: Reducer {
    struct RankingState: Equatable {
        var paths: [String] = []
        var message = ""
        var name: String = ""
        var isOn: Bool = false
    }
    
    enum RankingAction: Equatable {
        case getRankingInfo
        case refrashScroll
    }
    
    func reduce(into state: inout RankingState, action: RankingAction) -> Effect<RankingAction> {
        switch action {
        case .getRankingInfo:
            
            return .none
        case .refrashScroll:
            func getSomeData() async {
              await Task.sleep(3_000_000_000) // 3seconds
                state.isOn.toggle()
            }
            return .none
        }
    }
    
}

