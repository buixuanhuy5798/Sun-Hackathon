//
//  CameraController.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import CameraManager

final class CameraController: UIViewController, BindableType {
    
    @IBOutlet weak var cameraView: UIView!
    
    var viewModel: CameraViewModel!
    let cameraManager = CameraManager()
    @IBOutlet weak var snapPhotoButton: UIButton!
    @IBOutlet weak var cancleButton: UIButton!
    
    private let detectImagePush = PublishSubject<UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func bindViewModel() {
        let input = CameraViewModel.Input(detectTrigger: detectImagePush.asDriverOnErrorJustComplete())
        let output = viewModel.transform(input)
    }
    
    func config() {
        cameraManager.addPreviewLayerToView(self.cameraView)
        cameraManager.cameraOutputQuality = .medium
        
        snapPhotoButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                self.cameraManager.capturePictureWithCompletion({ [unowned self] image, err in
                    guard let image = image else { return }
                    self.detectImagePush.onNext(image)
                })
            }).disposed(by: rx.disposeBag)
    }
}

extension CameraController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.camera
}
