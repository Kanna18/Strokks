//
//  ItemDetailsCell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class ItemDetailsCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var LblName: LabelClass!
    @IBOutlet weak var LblInfo: LabelClass!
    @IBOutlet weak var LblRating: LabelClass!
    @IBOutlet weak var LblDuration: LabelClass!
    @IBOutlet weak var LblCost: LabelClass!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
