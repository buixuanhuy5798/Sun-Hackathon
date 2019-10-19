//
//  API+Server.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import Foundation

extension APIService {
    enum Url {
        static private let baseUrl = "http://10.0.3.242:3000/"
        static let detectUrl = baseUrl + "uploadpic"
        static let voucherUrl = baseUrl + "vouchers"
    }
}
