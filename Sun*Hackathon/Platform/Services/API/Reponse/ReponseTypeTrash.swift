//
//  ReponseTypeTrash.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import ObjectMapper

final class ReponseTypeTrash: Mappable {
    var classes = [TypeTrash]()
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        classes <- map["classes"]
    }
}



