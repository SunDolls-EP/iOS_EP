//
//  MainIntent.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/08.
//

import Foundation

final class MainIntent {
    
    private weak var model: MainModelActionsProtocol?

        init(model: MainModelActionsProtocol) {
            self.model = model
        }
    
    func dailyRanking() {
//        Requests.request(<#T##url: String##String#>, <#T##method: HTTPMethod##HTTPMethod#>, <#T##model: (Decodable & Encodable).Protocol##(Decodable & Encodable).Protocol#>, completion: <#T##(Decodable & Encodable) -> Void#>)
        print("dailyRanking")
    }
    func weeklyRanking() {
        
    }
    func monthlyRanking() {
        
    }
}


