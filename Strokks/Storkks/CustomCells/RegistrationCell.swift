//
//  RegistrationCell.swift
//  Storkks
//
//  Created by Gaian on 07/10/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class RegistrationCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func touchDownAction(_ sender: Any) {
        
        self.textField.isSecureTextEntry = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func touchUpinsideAction(_ sender: Any) {
        self.textField.isSecureTextEntry = true
    }
    
}
