//
//  UIImageView+.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

extension UIImageView {
    func toRoundImage() {
        self.layer.cornerRadius = self.height / 2
        self.clipsToBounds = true
    }
}
