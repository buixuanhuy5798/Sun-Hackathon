//
//  ViewController.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate = self
    }
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let indexOfTab = tabBar.items?.index(of: item),
            indexOfTab == 2 else {
                return
        }
        let cameraController = CameraController.instantiate().then {
            $0.bindViewModel(to:
                CameraViewModel(useCase: CameraUseCase(detectRepo: DetectTrashRepository()),
                                navigator: CameraNavigator(navigation: navigationController!)))
            $0.tabBarItem = UITabBarItem(title: "Phân loại", image: #imageLiteral(resourceName: "camera"), tag: 2)
        }
        navigationController?.pushViewController(cameraController, animated: true)
    }

    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        guard viewController is CameraController else { return true }
        return false
    }
}

extension MainTabBarController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.mainTabBar
}
