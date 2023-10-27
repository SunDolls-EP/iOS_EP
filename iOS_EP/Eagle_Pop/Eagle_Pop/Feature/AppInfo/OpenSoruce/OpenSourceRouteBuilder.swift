//
//  OpenSourceRouterBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import LinkNavigator
import SwiftUI

struct OpenSourceRouteBuilder: RouteBuilder {
    var matchPath: String { "opensource" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                OpenSourceView(
                    store: .init(
                        initialState: OpenSourceCore.OpenSourceState(),
                        reducer: {
                            OpenSourceCore()
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
