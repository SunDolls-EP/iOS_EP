//
//  MainSideEffect.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/27.
//

import LinkNavigator

// MARK: - Page1SideEffect

public protocol MainSideEffect {

  var routeToPage2: () -> Void { get }
}

// MARK: - Page1SideEffectLive

public struct MainSideEffectLive {
  let navigator: LinkNavigatorType

  public init(navigator: LinkNavigatorType) {
    self.navigator = navigator
  }
}
extension MainSideEffectLive: MainSideEffect {
    public var routeToPage2: () -> Void {
        {
          navigator.next(paths: [""], items: [:], isAnimated: true)
        }
    }
    
    public var getPaths: () -> [String] {
      {
        navigator.currentPaths
      }
    }
    

    public var routeToBack: () -> Void {
      {
        navigator.back(isAnimated: true)
      }
    }

  }
