//
//  SigninSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/27.
//

import LinkNavigator

// MARK: - SigninSideEffect

public protocol SigninSideEffect {
    var routeToTabView: () -> Void { get }
}

// MARK: - SigninSideEffectLive

public struct SigninSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension SigninSideEffectLive: SigninSideEffect {
    public var routeToTabView: () -> Void {
        {
            navigator.rootNext(paths: ["root"], items: [:], isAnimated: false)
            print("root")
        }
    }
}
