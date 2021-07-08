//
//  PostImageCell.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/26/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class PostImageCell: UICollectionViewCell {
    
    static let cellIdentifier = String(describing: self)
    
    private var postImage = UIImageView()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(postImage)
        postImage.contentMode = .scaleAspectFill
        postImage.snp.makeConstraints{ (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    func updateCell(image_url: String?) {
        if let url = URL(string: image_url ?? ""){
            postImage.kf.setImage(with: url)
        }
    }

}
