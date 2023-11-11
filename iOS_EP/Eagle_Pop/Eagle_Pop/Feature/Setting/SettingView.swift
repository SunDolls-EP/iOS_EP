//
//  SettingView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 11/6/23.
//

import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    let store: StoreOf<SettingCore>
    
    @State var setStudyTime: Int = 25
    @State var setRestTime: Int = 10
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    HStack(alignment: .center) {
                        Text("공부 시간: ")
                            .font(.custom(pretendardRegular, size: 30))
                            .padding(.leading, 70)
                        
                        CustomTimePickerViewInSetting(values: Array(25...50), selected: $setStudyTime)
                            .padding(.leading, -65)
                    }
                    .padding(.top, 300)
                    HStack(alignment: .center) {
                        Text("쉬는 시간 :")
                            .font(.custom(pretendardRegular, size: 28))
                            .padding(.leading, 70)
                        
                        CustomTimePickerViewInSetting(values: Array(5...20), selected: $setRestTime)
                            .padding(.leading, -65)
                    }
                    .padding(.top, 30)
                    Spacer()
                        .frame(height: 500)
                }
                .background(.white)
//                .navigationBarTitle(",", displayMode: .inline)
                
                .navigationBarHidden(false)
//                .navigationBarItems(leading: Button {
//                    viewStore.send(.back)
//                } label: {
//                    Text("\(Image(systemName: "chevron.left")) 뒤로가기")
//                        .foregroundStyle(.blue)
//                        .font(.custom(pretendardRegular, size: 20))
//                })
//                .navigationBarItems(trailing: Button {
//                    viewStore.send(.save)
//                } label: {
//                    Text("저장하기")
//                        .foregroundStyle(.blue)
//                        .font(.custom(pretendardRegular, size: 20))
//                })
                
            }
        }
    }
}

#Preview {
    SettingView(store: Store(initialState: SettingCore.State()) { SettingCore() })
}
