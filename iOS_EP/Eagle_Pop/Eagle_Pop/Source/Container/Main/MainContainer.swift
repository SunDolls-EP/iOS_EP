//
//  MainContainer.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/08.
//

import SwiftUI
import Combine

final class MainContainer<Intent, Model>: ObservableObject {
    @Published var mainModel: MainModel = MainModel()
    
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

