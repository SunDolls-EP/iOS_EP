//
//  MainRouteBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/26.
//

import LinkNavigator
import SwiftUI

struct MainRouteBuilder: RouteBuilder {
  var matchPath: String { "main" }

  var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
    { _, _, _ in
      WrappingController(matchPath: matchPath) {
        MainView(
          store: .init(
            initialState: MainCore.State(),
            reducer: {
                MainCore()
            }))
      }
    }
  }
}
