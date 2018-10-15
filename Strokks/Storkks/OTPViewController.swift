//
//  OTPViewController.swift
//  Storkks
//
//  Created by Gaian on 07/10/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var otpTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func submitClick(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.imageView.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let revealVC = self.storyboard?.instantiateViewController(withIdentifier: "sWRevealViewController") as!     SWRevealViewController
            self.present(revealVC, animated: true, completion: nil)
        }

        
    }
    
    @IBAction func closeClick(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
