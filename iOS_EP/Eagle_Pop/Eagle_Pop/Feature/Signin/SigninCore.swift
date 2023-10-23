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


struct SigninCore: Reducer {
    @Dependency(\.sideEffect.signin) var sideEffect
    
    
    struct SigninState: Equatable {
        var paths: [String] = []
        var message = ""
        var quote: String = "오늘 걷지 않으면 내일은 뛰어야 한다"
        var givenName: String = ""
        var profilePicUrl: String = ""
        var isLoggedIn: Bool = false
        var errorMessage: String = ""
        
    }
    
    enum SigninAction: Equatable {
        case selectSignin
        case didLogin(oauth2: String)
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
//            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
//                guard error == nil else { return }
//                guard let signInResult = signInResult else { return }
//                
//                let idToken = String(signInResult.user.idToken!.tokenString)
//                print(idToken)
//                
//                signInResult.user.refreshTokensIfNeeded { user, error in
//                    guard error == nil else {
//                        print("구글 로그인 에러!")
//                        print(error?.localizedDescription)
//                        return
//                    }
//                    guard let user = user else { return }
//                    
//                    let url = "\(api)/login/oauth2/authorize/google"
//                    let headers = ["Authorization": idToken]
//                    AF.request(url, method: .get, headers: ["Authorization": idToken])
//                        .validate()
//                        .responseDecodable(of: SigninModel.self) { response in
//                            switch response.result {
//                            case .success(let value):
//                                print("Success: \(value)")
                                sideEffect.routeToTabView()
//                            case .failure(let error):
//                                print("Error: \(error.localizedDescription)")
//                            }
//                        }
//                }
//            }
            
            return .none
            
        case .didLogin(let _):
            
            return .none
        }
    }
    
    
}

