//
//  CreateGroupVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/14/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailSearchTextField: insetTextField!
    @IBOutlet weak var descriptionTextField: insetTextField!
    @IBOutlet weak var titleTextField: insetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    var emails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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
            
            cell.setupView(image: userImage!, email: email, isSelected: true)
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
}
