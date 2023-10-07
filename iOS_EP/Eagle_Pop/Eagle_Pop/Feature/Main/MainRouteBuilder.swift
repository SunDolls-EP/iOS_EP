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
      { _, items, _ in
        WrappingController(matchPath: matchPath) {
            MainView(
            store: .init(
              initialState: MainCore.MainState(message: items.getValue(key: "page4-message") ?? ""),
              reducer: {
                  MainCore()
              }))
        }
      }
    }
}
extension [String: String] {
  fileprivate func getValue(key: String) -> String? {
    first(where: { $0.key == key })?.value as? String
  }
}
