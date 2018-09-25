//
//  HomeVC.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    var newsTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = self
        newsTable.dataSource = self
        let invisible_height = tabbarHeight + topbarHeight
        newsTable.estimatedRowHeight = self.view.frame.height - invisible_height
        newsTable.rowHeight = self.view.frame.height - invisible_height
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Instagramm"
    }
    
    override func viewWillLayoutSubviews() {
        configureUI()
    }
    
    func configureUI(){
        self.view.addSubview(newsTable)
        newsTable.snp.remakeConstraints{ (make) -> Void in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            } else {
                make.top.equalTo(view.snp.top)
            }
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
}
