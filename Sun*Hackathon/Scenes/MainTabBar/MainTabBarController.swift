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
    
}

extension MainTabBarController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.mainTabBar
}
