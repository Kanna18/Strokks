//
//  RegistrationViewController.swift
//  Storkks
//
//  Created by Gaian on 07/10/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit
import ZVProgressHUD

let registrationTextfieldTag = 200

class RegistrationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    let tvArray = ["Mobile Number","Email","Set Password","First Name","Last Name"]
    var myDict = [Int:String]()
    var currentTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        ZVProgressHUD.displayStyle = .dark

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func closeClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)        
    }
    
    @IBAction func submitClick(_ sender: Any) {

        self.reistrationValidation()
//        let otpVC = self.storyboard?.instantiateViewController(withIdentifier: "oTPViewController") as! OTPViewController
//        self.navigationController?.pushViewController(otpVC, animated: true)
////        let revealVC = self.storyboard?.instantiateViewController(withIdentifier: "sWRevealViewController") as! SWRevealViewController
////        self.present(revealVC, animated: true, completion: nil)
        
    }
    
    //MARK: -TableView Delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tvArray.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:RegistrationCell = tableView.dequeueReusableCell(withIdentifier: "registrationCell", for: indexPath) as! RegistrationCell
        cell.textField.tag = registrationTextfieldTag + indexPath.row
        if indexPath.row == 2{
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
    
    //MARK: -TextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        myDict.updateValue(textField.text!, forKey: textField.tag)
        print(myDict)
    }

    func reistrationValidation() {
        
        currentTextField.resignFirstResponder()
        
        guard let phoneNum = myDict[registrationTextfieldTag], phoneNum.isPhoneNumber else {
            ZVProgressHUD.showError(with: "Please enter a valid phone number", in: self.view, delay: 0.0)
            return
        }
        guard let email = myDict[registrationTextfieldTag+1], email.isValidEmail else {
            ZVProgressHUD.showError(with: "please enter a valid email Id", in: self.view, delay: 0.0)
            return
        }
        guard let password = myDict[registrationTextfieldTag+2], !(password.count < 6) else {
            ZVProgressHUD.showError(with: "password length should be minimum 6 characters", in: self.view, delay: 0.0)
            return
        }
        guard  let firstN = myDict[registrationTextfieldTag+3], !(firstN.count < 1) else {
            ZVProgressHUD.showError(with: "first name should not be empty", in: self.view, delay: 0.0)
            return
        }
        guard  let lastNam = myDict[registrationTextfieldTag+4], !(lastNam.count < 1) else {
            ZVProgressHUD.showError(with: "last name should not be empty", in: self.view, delay: 0.0)
            return
        }
        let urlString = "\(ServiceDataConst.kRegistrationURL)"
        let restURL = URL(string: urlString)
        var request = URLRequest(url: restURL!)
        let json = ["first_name":firstN ,
                    "email":email,
                    "phone":phoneNum,
                    "password":password,
                    "last_name":lastNam]
        let postBody = json.description
        request.httpBody = postBody.data(using: .utf8)
        StorksWebserviceCalls().sendPOST(request, withSuccess: { (data) in
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            do{
                let myDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject]
                print(myDict!)
            }catch{
                print("Error")
            }
        }) { (error) in
            
        }
        
        
    }
}


extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    var isValidEmail: Bool {
        do {
            
            let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: self)
            return result
        } catch {
            return false
        }
    }
}
