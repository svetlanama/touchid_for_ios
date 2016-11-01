//
//  ViewController.swift
//  TouchID_IOS
//
//  Created by Svitlana Moiseyenko on 11/1/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tLogin: UITextField! {
        didSet {
            tLogin.text = "test@gmail.com"
            tLogin.returnKeyType = .done
        }
    }
    @IBOutlet weak var tPassword: UITextField!{
        didSet {
            //tPassword.text = "123456"
            tPassword.returnKeyType = .done
        }
    }
    var activeTextField = UITextField()
    
    @IBAction func onLogin(_ sender: Any) {
        activeTextField.resignFirstResponder()
        loginUser(username: tLogin.text!, password: tPassword.text!)
    }
    
    @IBOutlet weak var bTouchID: UIButton!
    @IBAction func onTouchID(_ sender: Any) {
    }
    
    private var sharedDelegate: SharedDelegate? {
        get {
            return SharedDelegate.sharedInstance
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tPassword.text = ""
        bTouchID.isHidden = !(sharedDelegate?.isGetTouchIDKey())!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private  func loginUser(username: String, password: String) {
        UserService.login(email: username, pass: password) { [weak self] error in
            if error == nil {
                print("yraaa")
                self?.performSegue(withIdentifier: "segueMain", sender: self)
            } else {
               //AlertUtil.showAlert(self, title: "", message: msg, buttons: ["Ok": nil] )
            }
        }
    }


}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}


