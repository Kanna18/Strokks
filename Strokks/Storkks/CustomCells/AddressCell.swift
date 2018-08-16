//
//  AddressCell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var BtnDelete: ButtonClass!
    @IBOutlet weak var btnEdit: ButtonClass!
    @IBOutlet weak var LblAddress: LabelClass!
    @IBOutlet weak var LblHome: LabelClass!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
