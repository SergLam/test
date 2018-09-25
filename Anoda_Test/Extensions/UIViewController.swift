//
//  UIViewController.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/26/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    var tabbarHeight: CGFloat {
        return self.tabBarController?.tabBar.frame.height ?? 0.0
    }
}
