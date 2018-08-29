//
//  RegistrationView.swift
//  Storkks
//
//  Created by gaian  on 8/27/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class RegistrationView: UIView,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBAction func btnCloseTapped(_ sender: Any) {
        self.removeFromSuperview()
    }
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet var contentView: UIView!
     var btnShow = UIButton()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var arrSource : NSArray = ["Mobile Number","Set Password","First Name","Last Name"]

    
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
        Bundle.main.loadNibNamed("RegistrationView", owner: self, options: nil)
        self.tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        addSubview(contentView)
        contentView.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.red
        // UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        btnShow.backgroundColor = UIColor.red
        btnShow.frame = CGRect(x: 0, y: 0, width: 60, height:  30)
        btnShow.setTitle("Show", for: .normal)
        btnShow.setTitleColor(.blue, for: .normal)
        btnShow.addTarget(self, action: #selector(btnShowTapped(_:)), for: .touchUpInside)
    }
    //MARK: Tableview methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrSource.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil
        {
            cell = UITableViewCell()
        }
        if indexPath.row == 1
        {
            cell.accessoryView = btnShow
        }
           cell.contentView.addSubview(self.createTextFields(row: indexPath.row))
        
       
        
        cell.selectionStyle = UITableViewCellSelectionStyle.default
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40
    }
    private func createTextFields(row:Int)-> UITextField
    {
        let  textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: (self.frame.size.width), height:  (self.frame.size.height))
        textField.delegate = self
        textField.placeholder = arrSource[row] as? String
        textField.enablesReturnKeyAutomatically = true
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.yellow
        textField.textAlignment = .left
        if row == 1 {
            textField.isSecureTextEntry = true
        }
       return textField
        
    }
    @objc  func btnShowTapped(_: UIButton!) {
        
//        password.isSecureTextEntry = !password.isSecureTextEntry
//        if let textRange = password.textRange(from: password.beginningOfDocument, to: password.endOfDocument) {
//            password.replace(textRange, withText: password.text!)
//        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return true
    }
}
