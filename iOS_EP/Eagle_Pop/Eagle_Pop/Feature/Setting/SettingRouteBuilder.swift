//
//  SettingRouteBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/11/06.
//

import LinkNavigator

struct SettingRouteBuilder: RouteBuilder {
    
    var matchPath: String { "setting" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SettingView(
                    store: .init(
                        initialState: SettingCore.State(),
                        reducer: {
                            SettingCore()
                        }))
            }
        }
    }
}
