//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    func setupView(){
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
