//
//  PostVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/11/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController , UITextViewDelegate {

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        
        sendBtn.bindToKeyboard()
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.emailLbl.text = Auth.auth().currentUser?.email
        }
    }

   
    @IBAction func sendBtnPressed(_ sender: UIButton) {
        if textView.text != nil && textView.text != "Say something here......" {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (success) in
                if success {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else {
                    self.sendBtn.isEnabled = true
                    print("------error send button message ")
                }
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    
}
