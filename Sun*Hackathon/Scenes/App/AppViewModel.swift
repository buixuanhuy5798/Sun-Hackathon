//
//  AppViewModel.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import MGArchitecture

struct AppViewModel {
    let navigator: AppNavigator
    let useCase: AppUseCase
}

extension AppViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let toMain: Driver<Void>
    }
    
    func transform(_ input: AppViewModel.Input) -> AppViewModel.Output {
        let toMain = input.loadTrigger
            .do(onNext: { _ in
                self.navigator.toMainTabBar()
            })
        return Output(toMain: toMain)
    }
}
