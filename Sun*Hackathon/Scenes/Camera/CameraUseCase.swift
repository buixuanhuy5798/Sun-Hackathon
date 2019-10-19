//
//  CameraUseCase.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

protocol CameraUseCaseType {
    func detectImage(image: UIImage) -> Observable<[TypeTrash]>
}

struct CameraUseCase: CameraUseCaseType {
    
    let detectRepo: DetectTrashRepositoryType
    
    func detectImage(image: UIImage) -> Observable<[TypeTrash]> {
        return detectRepo.detectTrash(image: image)
    }
}
