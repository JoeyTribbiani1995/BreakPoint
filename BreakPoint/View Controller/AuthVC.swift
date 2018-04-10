//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func signInWithEmailBtnPressed(_ sender: UIButton) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func signInWithGoogleBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signInWithFacebookBtnPressed(_ sender: UIButton) {
        
    }
}
