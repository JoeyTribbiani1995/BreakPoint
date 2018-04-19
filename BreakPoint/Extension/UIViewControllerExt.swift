//
//  UIViewControllerExt.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/19/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDeatil(_ viewControllerToPresent : UIViewController) {
        let trasition = CATransition()
        trasition.duration = 0.3
        trasition.type = kCATransitionPush
        trasition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(trasition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let trasition = CATransition()
        trasition.duration = 0.3
        trasition.type = kCATransitionPush
        trasition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(trasition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
