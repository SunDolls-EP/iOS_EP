//
//  SigninCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/15.
//

import ComposableArchitecture
import UIKit
import GoogleSignIn
import Alamofire
import LinkNavigator
import SwiftUI


struct SigninCore: Reducer {
    @Dependency(\.sideEffect.signin) var sideEffect
    
    
    struct SigninState: Equatable {
        var paths: [String] = []
        var message = ""
        var quote: String = "오늘 걷지 않으면 내일은 뛰어야 한다"
        var givenName: String = ""
        var isLoggedIn: Bool = false
        var errorMessage: String = ""
        var username: String = "이름이 없습니다"
        var tag: String = "태그가 없습니다"
        var schoolName: String = "학교가 없습니다"
        var vartotalStudyTime: Int = 0
        var profileUrl: String = ""
        var prifileImage = Image( "https://lh3.googleusercontent.com/a/ACg8ocKdVx0I5ALRuGIcwFozzqfFm7vO1l4sElhN10HTqaL8=s96-c")
        
    }
    
    enum SigninAction: Equatable {
        case selectSignin
//        case didLogin(oauth2: String)
    }
    
    func reduce(into state: inout SigninState, action: SigninAction) -> Effect<SigninAction> {
        switch action {
        case .selectSignin:
            var rootViewController: UIViewController {
                if let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let root = screen.windows.first?.rootViewController {
                    return root
                } else {
                    return .init()
                }
            }
                                    GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                                        guard error == nil else { return }
                                        guard let signInResult = signInResult else { return }
                        
                                        let idToken = String(signInResult.user.idToken!.tokenString)
                                        print(idToken)
            
                                        Token.save(.accessToken, idToken)
            
                                        signInResult.user.refreshTokensIfNeeded { user, error in
                                            guard error == nil else {
                                                print("구글 로그인 에러!")
                                                print(error?.localizedDescription ?? "")
                                                return
                                            }
                                            guard user != nil else { return }
            
                                            let url = "\(api)/auth/login/oauth2/google"
                                            AF.request(url, method: .get, headers: ["Authorization": "\(Token.get(.accessToken)!)"])
                                                .validate()
                                                .responseDecodable(of: SigninModel.self) { response in
                                                    switch response.result {
                                                    case .success:
                                                        sideEffect.routeToTabView()
                                                    case .failure(let error):
                                                        
                                                        print("Signin selectSignin Error: \(error.localizedDescription)")
                                                    }
                                                }
                                        }
                                    }
            return .none
        }
    }
}

