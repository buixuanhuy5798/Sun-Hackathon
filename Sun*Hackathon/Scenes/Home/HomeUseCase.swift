//
//  HomeUseCase.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

protocol HomeUseCaseType {
    func getVouchers() -> Observable<[VoucherModel]>
}

struct HomeUseCase: HomeUseCaseType {
    func getVouchers() -> Observable<[VoucherModel]> {
        let request = VoucherRequest()
        let repository = VoucherRepository()
        return repository.getVouchers(input: request)
    }
}
