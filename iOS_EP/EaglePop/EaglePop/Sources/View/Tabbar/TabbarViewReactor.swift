//
//  TabbarViewReactor.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import ReactorKit
import RxCocoa
import UIKit
import RxSwift
class TabBarViewReactor: Reactor {
    typealias Action = TabBarAction

    struct State {
        // Define the state for the TabBarController
        var selectedIndex: Int = 0
    }

    let initialState: State
    let actionSubject: PublishRelay<Action> = PublishRelay()

    init() {
        initialState = State()
    }
}
