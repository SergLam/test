//
//  HomeVC.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController{

    var newsTable = UITableView()
    
    var jsonSource = JSONFileParser.shared
    
    var posts: [Post] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = self
        newsTable.dataSource = self
        newsTable.rowHeight = UITableView.automaticDimension
        posts = jsonSource.getLocalJSON()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Instagram"
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
