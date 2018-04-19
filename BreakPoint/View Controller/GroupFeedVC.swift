//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/18/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var viewSend: UIView!
    @IBOutlet weak var sendBtm: UIButton!
    @IBOutlet weak var messTextField: insetTextField!
    
    var group : Group?
    
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
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell") as? GroupFeedCell {
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: UIButton) {
    }
}
