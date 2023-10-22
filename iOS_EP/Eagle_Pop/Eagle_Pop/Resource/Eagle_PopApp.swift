//
//  Eagle_PopApp.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import LinkNavigator
import ComposableArchitecture

@main
struct Eagle_PopApp: App {
    @Dependency(\.sideEffect) var sideEffect
    
    
    // MARK: App
    var navigator: LinkNavigator {
        sideEffect.linkNavigator as! LinkNavigator
    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            navigator
                .launch(paths: ["signin"],
                        items: [:])
                .ignoresSafeArea(edges: .vertical)
        }
    }
}
