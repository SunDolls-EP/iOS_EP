//
//  MainRouteBuilder.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/10/18.
//

import LinkNavigator

struct MainRouteBuilder: RouteBuilder {
    
    var matchPath: String { "main" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                MainView(
                    selection: .constant(0),
                    store: .init(
                        initialState: MainCore.State(),
                        reducer: {
                            MainCore()
                        }))
            }
        }
    }
}
