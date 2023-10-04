//
//  EditProfileView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/26.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileView: View {
    let store: StoreOf<MenuCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .font(.headline)
                    .padding(.top, 20)
                    .frame(width: 140, height: 140)
                    .frame(alignment: .center)
                    .cornerRadius(30)
            }
            .navigationBarTitle(Text("Eagle Pop"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                store.send(.saveModifiedInfo)
            }, label: {
                Text("저장하기")
                    .foregroundColor(.blue)
            })
            )
        }
    }
}

#Preview {
    EditProfileView(store: Store(initialState:  MenuCore.State()) {
        MenuCore()})
}

