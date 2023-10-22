//
//  AppRouterGroup.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/26.
//

import LinkNavigator

struct AppRouterGroup {
  var routers: [RouteBuilder] {
    [
        RootTabRouteBuilder(),
        SigninRouteBuilder(),
        MainRouteBuilder(),
        SocialRouteBuilder(),
        RankingRouteBuilder(),
        MenuRouteBuilder(),
        AppInfoRouteBuilder()
      
    ]
  }
}
