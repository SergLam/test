//
//  PostImagesDelegateDataSource.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/27/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

extension HomeTableCell: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    // MARK: Post images collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostImageCell.cellIdentifier, for: indexPath) as! PostImageCell
        cell.updateCell(image: postImagesArray[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
            return
        }
        // Get collection view current index
        let indexes = collectionView.indexPathsForVisibleItems
        let currentPostImageCellIndex = indexes.first?.row ?? 0
        // Get HomeTable cell and set page controller index
        self.pageControl.currentPage = currentPostImageCellIndex
    }
}

