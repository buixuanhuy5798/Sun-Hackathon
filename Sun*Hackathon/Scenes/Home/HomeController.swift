//
//  HomeController.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

class HomeController: UIViewController {
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}

extension HomeController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.home
}
