//
//  RootTabRouteBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/6/23.
//

import Foundation
import LinkNavigator

struct RootTabRouteBuilder: RouteBuilder {
    
  var matchPath: String { "root" }

  var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
    { navigator, items, dependency in
        return WrappingController(matchPath: matchPath) {
        RootTabView(navigator: navigator)
      }
    }
  }
}
