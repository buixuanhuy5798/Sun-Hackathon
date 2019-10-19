//
//  VoucherReponse.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/20/19.
//  Copyright © 2019 huy. All rights reserved.
//

import ObjectMapper

final class VoucherReponse: Mappable {
    var voucher = [VoucherModel]()
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        voucher <- map["data"]
    }
}
