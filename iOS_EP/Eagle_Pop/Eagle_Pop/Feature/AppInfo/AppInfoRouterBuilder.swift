//
//  MenuRouterBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/11/23.
//

import LinkNavigator
import SwiftUI

struct AppInfoRouteBuilder: RouteBuilder {
    var matchPath: String { "appinfo" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                AppInfoView(
                    store: .init(
                        initialState: AppInfoCore.AppInfoState(),
                        reducer: {
                            AppInfoCore()
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
