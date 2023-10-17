//
//  SigninCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/15.
//

import Foundation
import ComposableArchitecture
import UIKit
import GoogleSignIn

struct SigninCore: Reducer {
    
    
    struct SigninState: Equatable {
        var quote: String = "오늘 걷지 않으면 내일은 뛰어야 한다"
        
    }
    
    enum SigninAction: Equatable {
        
        case selectSignin
        
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
            GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController) { signInResult, error in
                    guard let result = signInResult else {
                        // Inspect error
                        return
                    }
                    // If sign in succeeded, display the app's main content View.
                }
            
            
            return .none
            
        }
    }
}
