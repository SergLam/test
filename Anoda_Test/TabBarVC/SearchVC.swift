//
//  SearchVC.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Search"
    }
    
}
