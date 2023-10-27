//
//  DeveloperInfoView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/11/23.
//

import SwiftUI
import ComposableArchitecture

struct DeveloperInfoView: View {
    let store: StoreOf<DeveloperInfoCore>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            Text("Hello, World!")
                .toolbar(.visible, for: .navigationBar)

        }
    }
}
