//
//  SigninView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import ComposableArchitecture

struct SigninView: View {
    let store: StoreOf<SigninCore>
    
    var signinButtonHeight: CGFloat = 55
    
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Image("MainLogo")
                .frame(height: 200)
                .padding(.horizontal, 0)
                .padding(.top, 75)
            Text("\(viewStore.quote)")
                .font(.custom(pretendardMedium, size: 25))
                .padding(.top, 10)
            Spacer()
            VStack(spacing: 15) {
                Button {
                    viewStore.send(.selectSignin)
                    
                } label: {
                    HStack(spacing: 50) {
                        Image("developerInfo")
                            .frame(alignment: .leading)
                            .padding(.leading, 20)
                        Text("google로 로그인하기")
                            .font(.custom(pretendardBold, size: 14.47))
                        Spacer()
                    }
                }
                .frame(width: 325.5,height: signinButtonHeight)
                .background(.white)
                .cornerRadius(signinButtonHeight/2)
                .buttonStyle(CustomButtonStyle())
                .padding(.top, 0)
                
                Button {
                    viewStore.send(.selectSignin)
                } label: {
                    HStack(spacing: 50) {
                        Image("developerInfo")
                            .frame(alignment: .leading)
                            .padding(.leading, 20)
                        Text("카카오로 로그인하기")
                            .font(.custom(pretendardBold, size: 14.47))
                            .padding(.leading, 5)
                        Spacer()

                    }
                }
                .frame(width: 325.5, height: signinButtonHeight)
                .background(Color(red: 1, green: 0.9, blue: 0))
                .cornerRadius(signinButtonHeight/2)
                .buttonStyle(CustomButtonStyle())
                
                Text("-로그인 방식을 선택해주세요-")
                    .font(.custom(pretendardMedium, size: 15))
            }
            .padding(.top, 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    SigninView(store: Store(initialState: SigninCore.State()) {
        SigninCore()})
}
