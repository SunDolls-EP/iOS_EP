//
//  VersionInfoSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import LinkNavigator

public protocol VersionInfoSideEffect {
    var routeToBack: () -> Void { get }
}
public struct VersionInfoSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension VersionInfoSideEffectLive: VersionInfoSideEffect {
    public var routeToBack: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
