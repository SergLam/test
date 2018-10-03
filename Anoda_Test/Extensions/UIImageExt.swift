//
//  UIImage.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/26/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded(imageRarius: CGFloat) {
        self.layer.cornerRadius = imageRarius / 2 
        self.layer.masksToBounds = true
    }
    
}
