//
//  SigninRouteBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/18/23.
//

import LinkNavigator
import SwiftUI

struct SigninRouteBuilder: RouteBuilder {
    
    var matchPath: String { "signin" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
      { _, items, _ in
        WrappingController(matchPath: matchPath) {
            SigninView(
            store: .init(
              initialState: SigninCore.SigninState(),
              reducer: {
                  SigninCore()
              }))
        }
      }
    }
}
