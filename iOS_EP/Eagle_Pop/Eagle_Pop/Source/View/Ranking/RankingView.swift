//
//  RankingView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI

struct RankingView: View {
    
    @StateObject private var container: RankingContainer<RankingIntent, RankingModelStateProtocol>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    struct RankingView_Previews: PreviewProvider {
        static var previews: some View {
            RankingView.build()
        }
    }
}

extension RankingView {
    static func build() -> some View {
        let model = RankingModel()
        let intent = RankingIntent(model: model)
        let container = RankingContainer(
            intent: intent,
            model: model as RankingModelStateProtocol,
            modelChangePublisher: model.objectWillChange)
        return RankingView(container: container)
    }
}
