//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/18/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var messageContentLbl: UILabel!
    
    func setupView(mess : Message , profileImage : UIImage ){
        
        DataService.instance.getUserName(forUID: mess.senderId) { (returnEmail) in
            self.emailLbl.text = returnEmail
        }
        messageContentLbl.text = mess.content
        profileImageView.image = profileImage
    }
    
}
