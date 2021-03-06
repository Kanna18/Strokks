//
//  TopView.swift
//  Storkks
//
//  Created by gaian  on 8/14/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class TopView: UIView {

    @IBOutlet weak var lblLocDetails: UILabel!
    @IBOutlet weak var btnLocation: ButtonWithImage!
    @IBOutlet weak var contentView: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadFromNib()
    }
    
    
    private func loadFromNib()
    {
        Bundle.main.loadNibNamed("TopView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.red
        // UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }
}
