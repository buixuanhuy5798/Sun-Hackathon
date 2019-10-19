//
//  VoucherRequest.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/20/19.
//  Copyright © 2019 huy. All rights reserved.
//

import ObjectMapper

final class VoucherRequest: BaseRequest {
    required init() {
        super.init(url: APIService.Url.voucherUrl, requestType: .get)
    }
}
