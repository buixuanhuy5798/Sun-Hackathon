//
//  HomeViewModel.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

struct HomeViewModel {
    var navigator: HomeNavigatorType
    var useCase: HomeUseCaseType
}

extension HomeViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let vouchers: Driver<[VoucherModel]>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let indecator = ActivityIndicator()
        let error = ErrorTracker()
        let vouchers = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getVouchers()
                    .do(onNext: {
                        print($0.count)
                    })
                    .trackActivity(indecator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
        }
        return Output(vouchers: vouchers,
                      error: error.asDriver(),
                      indicator: indecator.asDriver())
    }
}
