//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class LoginVC: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var emailTextField: insetTextField!
    @IBOutlet weak var passwordTextField: insetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func signInBtnPressed(_ sender: UIButton) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthSerivce.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error) in
                if success {
                    print("-login success -----------")
                    self.dismiss(animated: true, completion: nil)
                    
                }else {
                     print(String(describing : error?.localizedDescription))
                }
                
                AuthSerivce.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, completion: { (success, error) in
                    if success {
                        print("-register success -----------")
                        AuthSerivce.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, completion: { (success, error) in
                            if success {
                                print("login success ----")
                                self.dismiss(animated: true, completion: nil)
                                
                            }else {
                                print(String(describing : error?.localizedDescription))
                            }
                        })
                        
                    }else {
                        print(String(describing : error?.localizedDescription))
                    }
                })
            }
        }
        
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
