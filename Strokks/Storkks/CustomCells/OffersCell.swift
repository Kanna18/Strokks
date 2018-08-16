//
//  OffersCell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class OffersCell: UITableViewCell {

    @IBOutlet weak var btnCoupon: ButtonClass!
    @IBOutlet weak var lblDealName: LabelClass!
    @IBOutlet weak var lblDealInfo: LabelClass!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
