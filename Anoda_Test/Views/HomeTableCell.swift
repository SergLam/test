//
//  HomeTableCell.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit
import SnapKit

class HomeTableCell: UITableViewCell{
 
    static let cellIdentifier = String(describing: self)
    
    var userProfileImage = UIImageView()
    var userName = UILabel()
    var userStatus = UILabel()
    var moreActions = UIButton()
//    var postImages = UICollectionView()
    var likeButton = UIButton()
    var nearLikeButton = UIButton()
    var pointButton = UIButton()
    var pinButton = UIButton()
    var pageControl = UIPageControl()
    var likedByList = UILabel()
    var postText = UILabel()
    var postCreationTime = UILabel()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // TODO: custom ui layout
        configureUI()
    }
    
    func configureUI(){
        contentView.addSubview(userProfileImage)
        userProfileImage.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.height.equalTo(contentView.frame.width)
            make.width.equalTo(contentView.frame.width)
        }
    
        
    }
    
    func updateCell(){
        userProfileImage.image = UIImage.init(named: "mr_black")
        userProfileImage.backgroundColor = UIColor.black
    }
}
