//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/11/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var emaiLbl: UILabel!
    
    func setupView(content : String , image : UIImage , email : String ){
        profileImageView.image = image
        contentLbl.text = content
        emaiLbl.text = email
    }

}
