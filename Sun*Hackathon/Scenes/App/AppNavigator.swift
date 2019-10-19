//
//  AppNavigator.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

protocol AppNavigatorType {
    func toMainTabBar()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMainTabBar() {
        let homeController = HomeController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Trang chủ", image: #imageLiteral(resourceName: "home"), tag: 0)
        }
        let locationController = LocationController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Thu gom", image: #imageLiteral(resourceName: "location"), tag: 1)
        }
        let historyController = HistoryController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Giao dịch", image: #imageLiteral(resourceName: "historyIcon"), tag: 2)
        }
        let profileController = HistoryController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Tài khoản", image: #imageLiteral(resourceName: "profile"), tag: 3)
        }
        let tabBarController = MainTabBarController.instantiate()
        tabBarController.viewControllers = [homeController, locationController, historyController, profileController]
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        let navigationController = UINavigationController(rootViewController: tabBarController)
        window.rootViewController = navigationController
    }
}

