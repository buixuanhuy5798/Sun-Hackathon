//
//  CameraViewModel.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import MGArchitecture

struct CameraViewModel {
    let useCase: CameraUseCaseType
    let navigator: CameraNavigatorType
}

extension CameraViewModel: ViewModelType {
    struct Input {
        let detectTrigger: Driver<UIImage>
    }
    
    struct Output {
        let ditected: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let detected = input.detectTrigger
            .flatMap {
            self.useCase.detectImage(image: $0).asDriverOnErrorJustComplete()
        }.drive()
        return Output(ditected: .empty())
    }

}
