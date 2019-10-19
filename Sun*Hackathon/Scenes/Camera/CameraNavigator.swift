//
//  CameraNavigator.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

protocol CameraNavigatorType {
    func showAlertDetected(type: String)
}

struct CameraNavigator: CameraNavigatorType {
    let navigation: UINavigationController
    
    func showAlertDetected(type: String) {
        let alert = UIAlertController(title: "Ảnh đã được phân tích",
                                      message: type,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        navigation.present(alert, animated: true, completion: nil)
    }
}
