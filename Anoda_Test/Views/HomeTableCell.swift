//
//  HomeTableCell.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit
import SnapKit

class HomeTableCell: UITableViewCell {

    var postImagesArray: [UIImage] = [UIImage.init(named: "mr_black")!, UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!,
                                      UIImage.init(named: "mr_black")!]
    
    static let cellIdentifier = String(describing: self)
    
    var userProfileImage = UIImageView()
    var userName = UILabel()
    var userStatus = UILabel()
    var moreActions = UIButton()
    
    var postImages: UICollectionView!
    let postImagesLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
//    var postImages = UIImageView()
    
    var likeButton = UIButton()
    var messageButton = UIButton()
    var shareButton = UIButton()
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
        self.selectionStyle = .none
        
        postImagesLayout.scrollDirection = .horizontal
        let width = UIScreen.main.bounds.width
        postImagesLayout.itemSize = CGSize(width: width, height: width)
        postImagesLayout.minimumLineSpacing = 0
        postImages = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: postImagesLayout)
        postImages.isPagingEnabled = true
        postImages.register(PostImageCell.self, forCellWithReuseIdentifier: PostImageCell.cellIdentifier)
        postImages.delegate = self
        postImages.dataSource = self
        postImages.showsVerticalScrollIndicator = false
    }
        
//    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
//        postImages.delegate = dataSourceDelegate
//        postImages.dataSource = dataSourceDelegate
//        postImages.tag = row
//        postImages.setContentOffset(postImages.contentOffset, animated:false) // Stops collection view if it was scrolling.
//        postImages.reloadData()
//    }

    
    override func layoutSubviews() {
        // TODO: custom ui layout
        configureUI()
    }
    
    func configureUI(){

        contentView.addSubview(userProfileImage)
        userProfileImage.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.width.equalTo(40)
        }
        
        userProfileImage.layer.borderWidth = 1
        userProfileImage.layer.borderColor = UIColor.black.cgColor
        userProfileImage.layer.cornerRadius = 40 / 2
        userProfileImage.layer.masksToBounds = true
        
        contentView.addSubview(userName)
        userName.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(userProfileImage.snp.top)
            make.left.equalTo(userProfileImage.snp.right).offset(10)
            make.height.equalTo(userName.font.lineHeight)
            make.right.equalTo(contentView.snp.right).offset(30)
        }
        contentView.addSubview(userStatus)
        userStatus.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(userName.snp.top).offset(userName.font.lineHeight)
            make.left.equalTo(userName.snp.left)
            make.height.equalTo(userStatus.font.lineHeight)
            make.right.equalTo(contentView.snp.right).offset(30)
        }
        
        contentView.addSubview(moreActions)
        moreActions.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(userName.snp.bottom).offset(-userStatus.font.lineHeight/2)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.height.equalTo(5)
            make.width.equalTo(15)
        }
        moreActions.setImage(UIImage.init(named: "more_button"), for: .normal)
        
        contentView.addSubview(postImages)
        postImages.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(userProfileImage.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left)
            make.width.height.equalTo(contentView.frame.width)
        }
        
        contentView.addSubview(pinButton)
        pinButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.height.equalTo(30)
            make.width.equalTo(20)
        }
        
        contentView.addSubview(likeButton)
        likeButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.width.equalTo(30)
        }
        
        contentView.addSubview(messageButton)
        messageButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(likeButton.snp.right).offset(10)
            make.height.width.equalTo(30)
        }
        
        contentView.addSubview(shareButton)
        shareButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(messageButton.snp.right).offset(10)
            make.height.width.equalTo(30)
        }
        
        
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        
        
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pageControl)
        pageControl.snp.remakeConstraints{ (make) -> Void in
            make.centerX.equalTo(contentView.center.x)
            make.centerY.equalTo(likeButton.snp.centerY)
        }
        
        likedByList.lineBreakMode = NSLineBreakMode.byWordWrapping
        likedByList.numberOfLines = 2
        contentView.addSubview(likedByList)
        likedByList.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(likeButton.snp.bottom).offset(10)
            make.left.equalTo(likeButton.snp.left)
            make.width.equalTo(contentView.frame.width - 10)
        }
        
        postText.lineBreakMode = NSLineBreakMode.byWordWrapping
        postText.numberOfLines = 3
        contentView.addSubview(postText)
        postText.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(likedByList.snp.bottom).offset(10)
            make.left.equalTo(likeButton.snp.left)
            make.width.equalTo(contentView.frame.width - 10)
        }
        
        postCreationTime.text = postCreationTime.text?.uppercased()
        contentView.addSubview(postCreationTime)
        postCreationTime.snp.remakeConstraints{ (make) -> Void in
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.left.equalTo(likeButton.snp.left)
            make.width.equalTo(contentView.frame.width - 10)
        }
                
    }
    
    func updateCell(){
        userProfileImage.image = UIImage.init(named: "mr_black")
        userProfileImage.backgroundColor = UIColor.black
        
        userName.text = "User Name"
        userStatus.text = "Some stupid user status"
        
//        postImages.image = UIImage.init(named: "mr_black")
        postImages.reloadData()
        
        pinButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        
        likeButton.setImage(UIImage.init(named: "like_pressed"), for: .normal)
        
        messageButton.setImage(UIImage.init(named: "message"), for: .normal)
        
        shareButton.setImage(UIImage.init(named: "share"), for: .normal)
        
        likedByList.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin mattis turpis id ante bibendum euismod."
        
        postText.text = "Test task, no mercy @black_overlord @apple_one_love #ios #swift  #obj-c #anoda #kharkiv #no_storyboard #no_xib #snapkit_forever"
        
        postCreationTime.text = "3 hours ago"
    }
    
}
