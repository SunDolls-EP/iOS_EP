//
//  SigninView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import GoogleSignInSwift

struct SigninView: View {
    var body: some View {
        VStack {
            Image("MainLogo")
                .frame(alignment: .center)
                .padding([.leading, .trailing], 65)
            
        }
        Text("명언")
            .font(.system(size: 30, weight: .semibold))
//        GoogleSignInButton
//        Button("카카오톡으로 로그인하기") { <#T##() -> Void#>}

        
    }
}

#Preview {

        SigninView()
}
