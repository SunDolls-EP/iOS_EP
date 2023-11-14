//
//  VersionInfoRouterBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/24.
//

import LinkNavigator
import SwiftUI

struct VersionInfoRouteBuilder: RouteBuilder {
    var matchPath: String { "versioninfo" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                VersionInfoView(
                    store: .init(
                        initialState: VersionInfoCore.VersionInfoState(),
                        reducer: {
                            VersionInfoCore()
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
