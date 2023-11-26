//
//  AppSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/11/23.
//

import Dependencies
import Foundation
import LinkNavigator

// MARK: - EmptyDependency

public struct EmptyDependency: DependencyType { }

private var navigator: LinkNavigatorType = LinkNavigator(
    dependency: EmptyDependency(),
    builders: AppRouterGroup().routers)

// MARK: - AppSideEffect

public struct AppSideEffect: DependencyKey {
    
    let linkNavigator: LinkNavigatorType
    let signin: SigninSideEffect
    let root: RootTabSideEffect
    let main: MainSideEffect
//    let social: SocialSideEffect
//    let ranking: RankingSideEffect
    let menu: MenuSideEffect
    let appInfo: AppInfoSideEffect
    let openSource: OpenSourceSideEffect
    let developerInfo: DeveloperInfoSideEffect
    let versionInfo: VersionInfoSideEffect
    let editProfile: EditProfileSideEffect
    let setting: SettingSideEffect
    
    public static var liveValue: AppSideEffect {
        .init(
            linkNavigator: navigator,
            signin: SigninSideEffectLive(navigator: navigator),
            root: RootTabSideEffectLive(navigator: navigator),
            main: MainSideEffectLive(navigator: navigator),
            menu: MenuSideEffectLive(navigator: navigator),
            appInfo: AppInfoSideEffectLive(navigator: navigator),
            openSource: OpenSourceSideEffectLive(navigator: navigator),
            developerInfo: DeveloperInfoSideEffectLive(navigator: navigator),
            versionInfo: VersionInfoSideEffectLive(navigator: navigator), 
            editProfile: EditProfileSideEffectLive(navigator: navigator),
            setting: SettingSideEffectLive(navigator: navigator)
            

        )
    }
}

extension DependencyValues {
    var sideEffect: AppSideEffect {
        get { self[AppSideEffect.self] }
        set { self[AppSideEffect.self] = newValue }
    }
}
