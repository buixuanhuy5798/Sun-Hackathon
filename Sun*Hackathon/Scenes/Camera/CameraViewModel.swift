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
        let ditected: Driver<String>
    }
    
    func transform(_ input: Input) -> Output {
        let detected = input.detectTrigger
            .flatMap {
                self.useCase.detectImage(image: $0).asDriverOnErrorJustComplete()
            }.map { list -> String in
                var tmp = list
                let max = tmp.sorted(by: { $0.score > $1.score })[0]
                if max.score > 0.9 { return "Day la rac " + max.className }
                else if max.score < 0.9 && max.score >= 0.5 {
                    return "Day co the la " + max.className
                } else {
                    return "Chua the xac dinh duoc. Vui long thu lai"
                }
            }
        return Output(ditected: detected.asDriver())
    }

}
