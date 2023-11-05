//
//  MainSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/18.
//

import LinkNavigator

// MARK: - MainSideEffect

public protocol MainSideEffect {
    
    var routeToSetting: () -> Void { get }
}

// MARK: - MainSideEffectLive

public struct MainSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension MainSideEffectLive: MainSideEffect {
    public var routeToSetting: () -> Void {
        {
            navigator.next(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
}
