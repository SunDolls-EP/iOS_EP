//
//  EditProfileView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/26.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileView: View {
    
    let store: StoreOf<EditProfileCore>
    
    @State private var editProfileState = EditProfileCore.EditProfileState()

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    viewStore.image
                        .resizable()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .font(.largeTitle)
                        .frame(width: 140, height: 140)
                        .frame(alignment: .top)
                        .cornerRadius(140/2)
                    HStack {
                        
                        VStack(spacing: 0) {
                            TextField("이름을 입력해주세요", text: $editProfileState.name)
                                .frame(width: 290, height: 50)
                                .padding(.top, 30)
                                .textFieldStyle(.automatic)
                            Rectangle()
                                .frame(width: 290, height: 1)
                                .foregroundColor(.gray)
                                .padding(.top, 0)
                            
                            TextField("학교를 입력해주세요", text: $editProfileState.school)
                            .frame(width: 290, height: 50)
                            .padding(.top, 30)
                            .textFieldStyle(.automatic)
                            Rectangle()
                                .frame(width: 290, height: 1)
                                .foregroundColor(.gray)
                                .padding(.top, 0)
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 50)
                .navigationBarTitle(Text("Eagle Pop"), displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    viewStore.send(.back)
                }, label: {
                    Text("\(Image(systemName: "chevron.left")) 뒤로가기")
                        .foregroundColor(.blue)
                })
                )
                .navigationBarItems(trailing: Button(action: {
                    viewStore.send(.saveModifiedInfo)
                }, label: {
                    Text("저장하기")
                        .foregroundColor(.blue)
                })
                )
            }
        }
    }
}

#Preview {
    EditProfileView(store: Store(initialState:  EditProfileCore.State()) {
        EditProfileCore()})
}

