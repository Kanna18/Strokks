//
//  OrdersCell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class OrdersCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var LblResName: LabelClass!
    @IBOutlet weak var LblResLocation: LabelClass!
    @IBOutlet weak var LblItems: LabelClass!
    @IBOutlet weak var LblOrderTime: LabelClass!
    @IBOutlet weak var LblCost: LabelClass!
    @IBOutlet weak var LblOrderStatus: LabelClass!
    @IBOutlet weak var LblRating: LabelClass!
    @IBOutlet weak var LblStar: LabelClass!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
