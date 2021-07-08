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
        posts = jsonSource.postsFromLocalJSON()
        self.title = "Instagram"
        configureUI()
    }
    
    func configureUI() {
        newsTable.separatorStyle = .none
        self.view.addSubview(newsTable)
        newsTable.snp.makeConstraints{ (make) -> Void in
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
