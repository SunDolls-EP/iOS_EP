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
        model?.selectDaily()
        
    }
    func weeklyRanking() {
        model?.selectWeekly()
        
    }
    func monthlyRanking() {
        model?.selectMonthly()
        
    }
}


