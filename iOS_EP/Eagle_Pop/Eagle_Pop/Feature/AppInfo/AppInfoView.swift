//
//  AppInfoView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/3/23.
//

import SwiftUI
import ComposableArchitecture

struct AppInfoView: View {
    let store: StoreOf<AppInfoCore>
    
    let appInfoArray: [AppInfoArray] = [
        AppInfoArray(
            appInfo: [
                AppInfo(image: "openSource", title: "오픈소스 라이선스"),
                AppInfo(image: "developerInfo", title: "개발자 정보"),
                AppInfo(image: "versionInfo", title: "버전 정보"),
                AppInfo(image: "logOut", title: "로그아웃")])
    ]
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            ForEach(appInfoArray, id: \.self) { array in
                Section {
                    ForEach(array.appInfo) { info in
                        Button(action: {
                            viewStore.send(.selectAppInfo(title: info.title))
                        })  {
                            HStack {
                                Image(info.image)
                                    .resizable()
                                    .foregroundColor(Color("default"))
                                    .background(.gray)
                                    .frame(width: 35, height: 35)
                                    .cornerRadius(35/2)
                                    .padding(.leading, 15)
                                if info.title == "로그아웃" {
                                    Text(info.title)
                                        .foregroundColor(.red)
                                        .font(.custom(pretendardSemiBold, size: 16))
                                } else {
                                    Text(info.title)
                                        .foregroundColor(.black)
                                        .font(.custom(pretendardSemiBold, size: 16))
                                }
                            }
                        }
                    }
                }
                .frame(minHeight: 60)
                .listRowInsets(EdgeInsets())
            }
        }
    }
}
