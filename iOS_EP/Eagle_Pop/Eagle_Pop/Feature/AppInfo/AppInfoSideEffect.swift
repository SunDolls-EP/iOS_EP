//
//  AppInfoSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/21.
//

import LinkNavigator

public protocol AppInfoSideEffect {
    
    var routeToOpenSource: () -> Void { get }
    
    var routeToDeveloperInfo: () -> Void { get }
    
    var routeToVersionInfo: () -> Void { get }
    
}
public struct AppInfoSideEffectLive {
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}
extension AppInfoSideEffectLive: AppInfoSideEffect {
    public var routeToOpenSource: () -> Void {
        {
            navigator.next(paths: ["opensource"], items: [:], isAnimated: true)
        }
    }
    public var routeToDeveloperInfo: () -> Void {
        {
            navigator.next(paths: ["developerinfo"], items: [:], isAnimated: true)
        }
    }
    public var routeToVersionInfo: () -> Void {
        {
            navigator.next(paths: ["versioninfo"], items: [:], isAnimated: true)
        }
    }
}
