//
//  RankingContainer.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/11.
//

import Foundation
import Combine

final class RankingContainer<Intent, Model>: ObservableObject {
    @Published var rankingModel: RankingModel = RankingModel()
    
    let intent: Intent
    let model: Model
    
    private var cancellable: Set<AnyCancellable> = []
    
    
    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}

