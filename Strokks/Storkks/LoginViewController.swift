//
//  LoginViewController.swift
//  Storkks
//
//  Created by Gaian on 07/10/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let tvArray = ["Mobile Number","Password"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func closeClick(_ sender: Any) {
        
    }

    @IBAction func forgotpasswordClick(_ sender: Any) {
    }
    
    @IBAction func submitClick(_ sender: Any) {
        
        let revealVC = self.storyboard?.instantiateViewController(withIdentifier: "sWRevealViewController") as! SWRevealViewController
        self.present(revealVC, animated: true, completion: nil)
        
    }
    
    @IBAction func registrationCLick(_ sender: Any) {
        
        let storyB = self.storyboard?.instantiateViewController(withIdentifier: "registrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(storyB, animated: true)
    }
    
    //MARK: -TableView Delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tvArray.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:RegistrationCell = tableView.dequeueReusableCell(withIdentifier: "registrationCell", for: indexPath) as! RegistrationCell
        if indexPath.row == 1{
            cell.button.isHidden = false
            cell.textField.isSecureTextEntry = true
        }else{
            cell.button.isHidden = true
            cell.textField.isSecureTextEntry = false
        }
        if indexPath.row == 0{
            cell.textField.keyboardType = .numberPad
        }else{
            cell.textField.keyboardType = .default
        }
        cell.textField.placeholder = tvArray[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.default
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }


}
