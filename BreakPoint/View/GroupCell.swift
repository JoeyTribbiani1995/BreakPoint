//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/18/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var titleGroupLbl: UILabel!
    @IBOutlet weak var descriptionGroupLbl: UILabel!
    @IBOutlet weak var memberGroupLbl: UILabel!
    
    func setupView(with group : Group) {
        self.titleGroupLbl.text = group.groupTitle
        self.descriptionGroupLbl.text = group.groupDesc
        self.memberGroupLbl.text = "\(group.memberCount) members"
    }

}
