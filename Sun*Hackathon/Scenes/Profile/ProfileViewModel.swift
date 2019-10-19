//
//  ProfileViewModel.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

struct ProfileViewModel {
    let navigator: ProfileNavigatorType
    let useCase: ProfileUseCaseType
}

extension ProfileViewModel: ViewModelType {
   
    struct Input {
        let inputTrigger: Driver<Void>
    }
    
    struct Output {
        let infomation: Driver<[String]>
    }
    
    func transform(_ input: ProfileViewModel.Input) -> ProfileViewModel.Output {
        let infomation = input.inputTrigger.flatMap { _ in
            return self.useCase.getInfomationProfile().asDriverOnErrorJustComplete()
        }
        return Output(infomation: infomation)
    }
    
}
