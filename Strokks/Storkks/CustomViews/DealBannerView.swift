//
//  AddressCell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class DealBannerView: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var targetURL: String?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
//    private convenience override init(frame: CGRect) {
//        //super.init(frame: CGRect.zero)
//        //self.init(with: "", andURL: "")
//        self.init(withImageURL: "", andTargetURL: "", frame: frame)
//        
//    }
    
    init(withImageURL imageURL: String, andTargetURL targetURL: String?, frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        // load/setup views from the nib
        Bundle.main.loadNibNamed("DealBannerView", owner: self, options: nil)
        self.frame = (frame == CGRect.zero) ? containerView.frame : frame
        self.targetURL = targetURL
        
        //imageView.image = UIImage(named: imageName)
        let imageURL = URL(string: "")
//        imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "banner_placeholder"), options: .retryFailed)
        imageView.layer.cornerRadius = 1.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        
        containerView.addSubview(imageView)
        self.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
