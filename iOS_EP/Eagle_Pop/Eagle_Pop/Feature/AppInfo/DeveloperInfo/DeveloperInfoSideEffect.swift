//
//  DeveloperInfoSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import LinkNavigator

public protocol DeveloperInfoSideEffect {
    var routeToBack: () -> Void { get }
}
public struct DeveloperInfoSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension DeveloperInfoSideEffectLive: DeveloperInfoSideEffect {
    public var routeToBack: () -> Void {
      {
        navigator.back(isAnimated: true)
      }
    }
}
