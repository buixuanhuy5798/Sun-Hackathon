//
//  AppDelegate.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import RxSwift
import RxCocoa
import NSObject_Rx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        bindViewModel()
        return true
    }
    
    private func bindViewModel() {
        guard let window = window else { return }
        let navigator = AppNavigator(window: window)
        let useCase = AppUseCase()
        let viewModel = AppViewModel(navigator: navigator, useCase: useCase)
        
        let input = AppViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        output.toMain
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

