//
//  RankingIntent.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/09.
//

import Foundation

final class RankingIntent {
    
    private weak var model: RankingModelActionsProtocol?

        init(model: RankingModelActionsProtocol) {
            self.model = model
        }
}
