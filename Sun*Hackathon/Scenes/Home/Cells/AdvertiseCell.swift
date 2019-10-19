//
//  AdvertiseCell.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import SDWebImage

class AdvertiseCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var advertiseImage: UIImageView!
    @IBOutlet weak var advertiseLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContentCell(voucher: VoucherModel) {
        advertiseImage.sd_setImage(with: URL(string: voucher.urlImage))
        advertiseLabel.text = voucher.description
        costLabel.text = "\(voucher.cost) rPoint"
    }

}
