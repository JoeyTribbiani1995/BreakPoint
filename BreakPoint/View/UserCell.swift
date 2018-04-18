//
//  UserCell.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/14/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    var showing = false
    
    func setupView(image : UIImage , email : String , isSelected : Bool){
        self.userImageView.image = image
        self.emailLbl.text = email
        if isSelected {
            checkImageView.isHidden = false
        }else {
            checkImageView.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        showing = !showing
        
        if selected {
            if showing == false {
                checkImageView.isHidden = false
            }
            else {
                checkImageView.isHidden = true
            }
            
        }
    }

}
