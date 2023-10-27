//
// OpenSourceSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import LinkNavigator

public protocol OpenSourceSideEffect {
    var routeToBack: () -> Void { get }
}
public struct OpenSourceSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension OpenSourceSideEffectLive: OpenSourceSideEffect {
    public var routeToBack: () -> Void {
      {
        navigator.back(isAnimated: true)
      }
    }
}
