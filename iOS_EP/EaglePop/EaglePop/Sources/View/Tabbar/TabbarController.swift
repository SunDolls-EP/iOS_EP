//
//  TabbarController.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit
class TabBarController: UIViewController {
    let tabBarView: TabBarView

    let disposeBag = DisposeBag()

    init(reactor: TabBarViewReactor) {
        self.tabBarView = TabBarView()
        super.init(nibName: nil, bundle: nil)
        self.tabBarView.reactor = reactor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create reactors for each view controller
        let firstReactor = SocialReactor()
//        let secondReactor = RankingReactor()
//        let thirdReactor = StopWatchReactor()
//        let fourthReactor = CalendarReactor()
//        let fifthReactor = ProfileReactor()
        
        let firstViewController = SocialView()
        let secondViewController = RankingView()
        let thirdViewController = StopWatchView()
        let fourthViewController = CalendarView()
        let fifthViewController = ProfileView()
        
        tabBarView.viewControllers = [firstViewController, /*secondViewController, thirdViewController, fourthViewController, fifthViewController*/]


        // Add tabBarView as the custom view of the tab bar controller
//        self.setValue(tabBarView, forKey: "tabBar")
    }
}
