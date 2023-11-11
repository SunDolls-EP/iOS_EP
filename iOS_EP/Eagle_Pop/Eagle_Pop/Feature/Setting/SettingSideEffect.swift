//
//  SettingSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/11/06.
//

import LinkNavigator

// MARK: - SettingSideEffect

public protocol SettingSideEffect {
    
    var routeToSetting: () -> Void { get }
    var routeToBack: () -> Void { get }
}

// MARK: - MainSideEffectLive

public struct SettingSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension SettingSideEffectLive: SettingSideEffect {
    public var routeToSetting: () -> Void {
        {
            navigator.sheet(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
    public var routeToBack: () -> Void {
      {
        navigator.back(isAnimated: true)
      }
    }
}
