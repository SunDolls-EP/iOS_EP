//
//  AppDelegate.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/5/23.
//

import SwiftUI
import LinkNavigator

/// 외부 의존성과 화면을 주입받은 navigator 를 관리하는 타입
final class AppDelegate: NSObject {
  var navigator: LinkNavigator {
    LinkNavigator(dependency: AppDependency(), builders: AppRouterGroup().routers)
  }
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    true
  }
}
