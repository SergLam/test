//
//  HomeTableViewDelegateDataSource.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableCell.init(style: .default, reuseIdentifier: HomeTableCell.cellIdentifier)
        cell.postImages.register(PostImageCell.self, forCellWithReuseIdentifier: PostImageCell.cellIdentifier)
//        cell.setCollectionViewDataSourceDelegate(cell, forRow: indexPath.row)
        cell.updateCell()
        return cell
    }
    
}
