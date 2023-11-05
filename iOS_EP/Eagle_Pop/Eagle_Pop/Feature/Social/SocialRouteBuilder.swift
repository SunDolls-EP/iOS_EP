//
//  SocialRouteBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/18.
//

import LinkNavigator

struct SocialRouteBuilder: RouteBuilder {
    
    var matchPath: String { "social" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
      { _, items, _ in
        WrappingController(matchPath: matchPath) {
            SocialView(
            store: .init(
              initialState: SocialCore.SocialState(),
              reducer: {
                  SocialCore()
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
