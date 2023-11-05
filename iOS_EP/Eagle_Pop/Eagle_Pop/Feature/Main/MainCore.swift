//
//  MainCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/20.
//

import Foundation
import ComposableArchitecture
import AVFAudio
import Alamofire
import SwiftUI
import OpenTDS
import LinkNavigator

struct MainCore: Reducer {
    struct MainState: Equatable {
        var paths: [String] = []
        var message = ""
        var menuTitle: String = "주간 랭킹"
        var selection = 0
    }
    
    enum MainAction: Equatable {
        case postStudyTime
        case selectDaily
        case selectWeekly
        case selectMonthly
        case selectRanking
        case getSimpleRanking
        
        
        // MARK: - TimerView
        case soundPlay
        
    }
    
    func reduce(into state: inout MainState, action: MainAction) -> Effect<MainAction> {
        var state = state
        switch action {
        case .postStudyTime:
            //            Requests.simple("\(api)/user/study",
            //                            .post,
            //                            params: ["Authorization": "\(Token.get(.accessToken)!)"]) { responseData in
            //                let decoder = JSONDecoder()
            //                if let data = responseData, let decodedData = try? decoder.decode([PersonalRankingInfo].self, from: data) {
            //
            //                    print("Success: \(decodedData)")
            //                } else {
            //                    print("Error decoding data.")
            //                }
            //            }
            return .none
        case .selectDaily:
            state.menuTitle = "일간 랭킹"
            return .none
            
            
        case .selectWeekly:
            state.menuTitle = "주간 랭킹"
            return .none
            
        case .selectMonthly:
            state.menuTitle = "월간 랭킹"
            return .none
        case .selectRanking:
            state.selection = 2
            print("1")
            return .none
        case .getSimpleRanking:
            getSimpleRank()
            return .none
        case .soundPlay:
            
            return .none
            
        }
    }
    // MARK: - func
    
    func getSimpleRank() {
        let url = "\(api)/"
        AF.request(url, method: .get,
                   headers: ["Authorization":"\(Token.get(.accessToken)!)"])
        .validate()
        .responseDecodable(of: SigninModel.self) { response in
            switch response.result {
            case .success(let value):
                print("Success: \(value)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
