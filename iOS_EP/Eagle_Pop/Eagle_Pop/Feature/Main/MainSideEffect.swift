//
//  MainSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/18.
//

import LinkNavigator

// MARK: - MainSideEffect

public protocol MainSideEffect {
    
    var sheetToSetting: () -> Void { get }
}

// MARK: - MainSideEffectLive

public struct MainSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension MainSideEffectLive: MainSideEffect {
    public var sheetToSetting: () -> Void {
        {
            navigator.sheet(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
}
