//
//  VoucherRepository.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/20/19.
//  Copyright © 2019 huy. All rights reserved.
//

protocol VouchersRepositoryType {
    func getVouchers(input: VoucherRequest) -> Observable<[VoucherModel]>
}

struct VoucherRepository: VouchersRepositoryType {
    private let api = APIService.share
    func getVouchers(input: VoucherRequest) -> Observable<[VoucherModel]> {
        return api.request(input: input)
            .map { (reponse: VoucherReponse) -> [VoucherModel] in
            return reponse.voucher
        }
    }
}
