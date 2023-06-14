//
//  TabbarView.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift
enum TabBarAction {
    case selectedIndex(Int)
}

class TabBarView: UITabBarController, View {
    
    typealias Reactor = TabBarViewReactor

    var disposeBag = DisposeBag()

    // Implement the View protocol
    func bind(reactor: Reactor) {
        // Set up reactive bindings for tab selection
        self.rx.didSelect
            .map { [weak self] in self?.viewControllers?.firstIndex(of: $0) ?? 0 }
                        .distinctUntilChanged()
                        .map { TabBarAction.selectedIndex($0) }
                        .bind(to: reactor.action)
                        .disposed(by: disposeBag)
        // Set initial selected index
        reactor.state.map { $0.selectedIndex }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] index in
                self?.selectedIndex = index
            })
            .disposed(by: disposeBag)
    }
}
