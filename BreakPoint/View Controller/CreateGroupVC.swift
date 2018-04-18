//
//  CreateGroupVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/14/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailSearchTextField: insetTextField!
    @IBOutlet weak var descriptionTextField: insetTextField!
    @IBOutlet weak var titleTextField: insetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    var emails = [String]()
    var chosenUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        doneBtn.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    @IBAction func textEditChanged(_ sender: UITextField) {
        if emailSearchTextField.text == "" {
            emails = []
            tableView.reloadData()
        }else {
            DataService.instance.getEmailForSearchQuery(query: emailSearchTextField.text!) { (emailsReturn) in
                self.emails = emailsReturn
                self.tableView.reloadData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getIDs(forUserName: chosenUsers) { (ids) in
                var userIds = ids
                userIds.append((Auth.auth().currentUser?.uid)!)
                DataService.instance.createGroup(title: self.titleTextField.text!, description: self.descriptionTextField.text!, ids: userIds, completion: { (success, error) in
                    if success {
                        print("create a new group success")
                        self.dismiss(animated: true, completion: nil)
                    }else {
                        print("group can't create")
                    }
                })
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell {
            
            let userImage = UIImage(named : "defaultProfileImage")
            let email = emails[indexPath.row]
            
            if chosenUsers.contains(email){
                cell.setupView(image: userImage!, email: email, isSelected: true)
            }else {
                cell.setupView(image: userImage!, email: email, isSelected: false)
            }

            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUsers.contains(cell.emailLbl.text!){
            chosenUsers.append(cell.emailLbl.text!)
            groupMemberLbl.text = chosenUsers.joined(separator: ", ")
            doneBtn.isHidden = false
        }else {
            chosenUsers = chosenUsers.filter({ $0 != cell.emailLbl.text! })
            if chosenUsers.count >= 1 {
                groupMemberLbl.text = chosenUsers.joined(separator: ", ")
            }else {
                groupMemberLbl.text = "add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
    
    
    
    
    
    
}
