//
//  CreateGroupVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/14/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailSearchTextField: insetTextField!
    @IBOutlet weak var descriptionTextField: insetTextField!
    @IBOutlet weak var titleTextField: insetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
    }
    
}