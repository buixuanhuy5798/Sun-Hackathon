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

extension TypeTrash {
    func getNameVi() -> String {
        switch className {
        case "Compost":
            return "Hữu cơ"
        case "Landfill":
            return "Vô cơ"
        case "Recycle":
            return "Có thể tái chế"
        default:
            return ""
        }
    }
}
