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
                self.useCase.detectImage(image: $0)
                    .asDriverOnErrorJustComplete()
                    .map { self.useCase.convertToText(trashType: $0) }
            }
            .do(onNext: {
                self.navigator.showAlertDetected(type: $0)
            })
            .mapToVoid()
        
        return Output(ditected: detected.asDriver())
    }

}
