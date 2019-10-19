//
//  ProfileController.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

class ProfileController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        avatarImageView.toRoundImage()
    }
}

extension ProfileController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.profile
}
