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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell {
            
            let userImage = UIImage(named : "defaultProfileImage")
            cell.setupView(image: userImage!, email: "hello@gmail.com", isSelected: true)
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
}
