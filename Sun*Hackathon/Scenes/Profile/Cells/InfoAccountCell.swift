//
//  InfoAccountCell.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

class InfoAccountCell: UITableViewCell, NibReusable {
    @IBOutlet weak var iconCell: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpContentCell(icon: String, info: String) {
        iconCell.image = UIImage(named: icon)
        infoLabel.text = info
    }
}
