//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/18/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var viewSend: UIView!
    @IBOutlet weak var sendBtm: UIButton!
    @IBOutlet weak var messTextField: insetTextField!
    
    var group : Group?
    var groupMess = [Message]()
    
    func initGroupData(forGroup group : Group){
       self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
       
        sendBtm.bindToKeyboard()
        messTextField.bindToKeyboard()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (emailsReturn) in
            self.memberLbl.text = emailsReturn.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapShot) in
            DataService.instance.getAllMessagesFor(group: self.group!) { (returnGroupMess) in
                self.groupMess = returnGroupMess
                self.tableView.reloadData()
                
                if self.groupMess.count > 0 {
                    let endIndex = IndexPath(row: self.groupMess.count-1 , section: 0)
                    self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
                }
            }
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell") as? GroupFeedCell {
            
            let image = UIImage(named : "defaultProfileImage")
            let mess = groupMess[indexPath.row]
            cell.setupView(mess: mess, profileImage: image!)
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: UIButton) {
        print("send press ------------")
        if messTextField.text != "" {
            
            DataService.instance.uploadPost(withMessage: messTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key) { (success) in
                if success {
                    self.messTextField.resignFirstResponder()
                    self.messTextField.text = ""
                }
            }
        }
        
    }
}
