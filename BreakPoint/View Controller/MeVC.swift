//
//  MeVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/11/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            self.emailLbl.text = Auth.auth().currentUser?.email
        }
    }

    
    @IBAction func signOutBtnPressed(_ sender: UIButton) {
        let logoutPopup = UIAlertController(title: "Logout ?", message: "Are you sure ?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout ?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }catch {
                print("----error logout",error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
}
