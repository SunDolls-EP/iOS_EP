//
//  SocialReactor.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class SocialReactor: Reactor {
        enum Action {
            case appleLogin // 애플 로그인 액션
        }
        
        enum Mutation {
            case appleLoginMut
        }
        
        struct State {
            var loginStatus: Bool = false
        }
        
        let initialState = State()
        
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .appleLogin:
            return Observable.just(.appleLoginMut)
            
        }
    }
           
           func reduce(state: State, mutation: Mutation) -> State {
               var newState = state
               switch mutation {
               case .appleLoginMut:
                   appleLogin()
                   newState.loginStatus = true
                   return newState
           }
        func appleLogin() {
            print("didTabAppleLoginButton")
        }
    }

   
}
