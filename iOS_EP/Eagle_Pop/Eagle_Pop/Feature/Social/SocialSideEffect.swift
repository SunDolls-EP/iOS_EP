//
//  SocialSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/18.
//

import LinkNavigator

// MARK: - SocialSideEffect

public protocol SocialSideEffect {
    
    var routeToSetting: () -> Void { get }
}

// MARK: - SocialSideEffectLive

public struct SocialSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension SocialSideEffectLive: SocialSideEffect {
    public var routeToSetting: () -> Void {
        {
            navigator.next(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
}
