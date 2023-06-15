//
//  TabbarController.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = SocialView()
        firstViewController.tabBarItem.title = ""
        firstViewController.tabBarItem.image = UIImage(systemName: "person.3.fill")
        let secondViewController = RankingView()
        secondViewController.tabBarItem.title = ""
        secondViewController.tabBarItem.image = UIImage(systemName: "crown.fill")
        let thirdViewController = StopWatchView()
        thirdViewController.tabBarItem.title = ""
        thirdViewController.tabBarItem.image = UIImage(systemName: "timer")
        let fourthViewController = CalendarView()
        fourthViewController.tabBarItem.title = ""
        fourthViewController.tabBarItem.image = UIImage(systemName: "calendar")
        let fifthViewController = ProfileView()
        fifthViewController.tabBarItem.title = ""
        fifthViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        
        view.backgroundColor = .systemBackground
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .mainBackgroundColor
        self.tabBar.unselectedItemTintColor = .systemGray2
        
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController]
    }
}
