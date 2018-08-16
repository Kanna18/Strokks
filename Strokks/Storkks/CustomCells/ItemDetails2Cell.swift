//
//  ItemDetails2Cell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class ItemDetails2Cell: UITableViewCell {

    @IBOutlet weak var LblName: LabelClass!
    @IBOutlet weak var LblType: LabelClass!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var LblRating: LabelClass!
    @IBOutlet weak var LblDelivery: LabelClass!
    @IBOutlet weak var LblCost: LabelClass!
    @IBOutlet weak var LblDuration: LabelClass!
    @IBOutlet weak var imgPlaceHolder: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
