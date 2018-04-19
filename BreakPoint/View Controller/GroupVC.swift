//
//  GroupVC.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import Firebase

class GroupVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataService.instance.getAllGroup { (groupsReturn) in
            self.groups = groupsReturn
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell {
            
           let group = groups[indexPath.row]
            
            cell.setupView(with: group)
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else { return }
        groupFeedVC.initGroupData(forGroup: groups[indexPath.row])
        present(groupFeedVC, animated: true, completion: nil)
    }

   

}

