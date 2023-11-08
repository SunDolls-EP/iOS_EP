//
//  RootTabSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/19.
//

import LinkNavigator

// MARK: - SigninSideEffect

public protocol RootTabSideEffect {
    var getPaths: () -> [String] { get }
}

// MARK: - SigninSideEffectLive

public struct RootTabSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension RootTabSideEffectLive: RootTabSideEffect {
    public var getPaths: () -> [String] {
      {
        navigator.currentPaths
      }
    }
}
