//
//  TypeTrash.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import ObjectMapper

struct TypeTrash {
    var className = ""
    var score = 0.0
}

extension TypeTrash: Mappable {
    init?(map: Map) { self.init() }
    
    mutating func mapping(map: Map) {
        className <- map["class"]
        score <- map["score"]
    }
}
