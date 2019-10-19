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
        let tabBarController = MainTabBarController.instantiate()
        let navigationController = UINavigationController(rootViewController: tabBarController)
        
        let homeController = HomeController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Trang chủ", image: #imageLiteral(resourceName: "home"), tag: 0)
        }
        let locationController = LocationController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Thu gom", image: #imageLiteral(resourceName: "location"), tag: 1)
        }
        let cameraController = CameraController.instantiate().then {
            $0.bindViewModel(to:
                CameraViewModel(useCase: CameraUseCase(detectRepo: DetectTrashRepository()),
                                navigator: CameraNavigator(navigation: navigationController)))
            $0.tabBarItem = UITabBarItem(title: "Phân loại", image: #imageLiteral(resourceName: "camera"), tag: 2)
        }
        let historyController = HistoryController.instantiate().then {
            $0.tabBarItem = UITabBarItem(title: "Giao dịch", image: #imageLiteral(resourceName: "historyIcon"), tag: 3)
        }
        let profileController = ProfileController.instantiate().then {
            $0.bindViewModel(to: ProfileViewModel(navigator: ProfileNavigator(),
                                                  useCase: ProfileUseCase()))
            $0.tabBarItem = UITabBarItem(title: "Tài khoản", image: #imageLiteral(resourceName: "profile"), tag: 4)
        }

        tabBarController.viewControllers = [homeController, locationController, cameraController, historyController, profileController]
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        window.rootViewController = navigationController
    }
}

