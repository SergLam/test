//
//  PostImagesDataSource.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/27/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDelegate, UIScrollViewDelegate {
    // MARK: Post images collection view
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
                return
        }
        // Get collection view current index
        let indexes = collectionView.indexPathsForVisibleItems
        let currentPostImageCellIndex = indexes.first?.row ?? 0
        // Get HomeTable cell and set page controller index
        guard let visibleIndexPath = self.newsTable.indexPathsForVisibleRows?.first else{
            return
        }
        guard let homeTableCell = self.newsTable.cellForRow(at: visibleIndexPath) as? HomeTableCell else{
            return
        }
        homeTableCell.pageControl.currentPage = currentPostImageCellIndex
    }
    
    
}
