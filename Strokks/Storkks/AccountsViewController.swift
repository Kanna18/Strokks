//
//  AccountsViewController.swift
//  Storkks
//
//  Created by gaian  on 8/10/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {

    @IBOutlet weak var sideMenuBarBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            sideMenuBarBtn.target = self.revealViewController()
            sideMenuBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
         //   self.revealViewController().delegate = self as! SWRevealViewControllerDelegate
            
            // Loading Side Menu; To Subscribing: kInvalidUserNotification
            //            if let menuVC = self.revealViewController().rearViewController as? SideMenuVC  {
            //                Log.print("Loading Side Menu View: ", menuVC.view,  "For Subscribing: kInvalidUserNotification ")
            //            }
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
