//
//  DeveloperInfoRouterBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import LinkNavigator
import SwiftUI

struct DeveloperInfoRouteBuilder: RouteBuilder {
    var matchPath: String { "developerinfo" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                DeveloperInfoView(
                    store: .init(
                        initialState: DeveloperInfoCore.DeveloperInfoState(),
                        reducer: {
                            DeveloperInfoCore()
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
