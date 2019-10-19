//
//  VoucherModel.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/20/19.
//  Copyright © 2019 huy. All rights reserved.
//

import ObjectMapper

struct VoucherModel {
    var cost: Int
    var description: String
    var title: String
    var urlImage: String
}

extension VoucherModel {
    init() {
        self.init(cost: 0, description: "", title: "", urlImage: "")
    }
}

extension VoucherModel: BaseModel {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        cost <- map["cost"]
        description <- map["description"]
        title <- map["title"]
        urlImage <- map["urlImage"]
    }
}
