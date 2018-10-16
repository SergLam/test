//
//  HomeTableCell.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import SCLAlertView

class HomeTableCell: UITableViewCell {
    static let cellIdentifier = String(describing: self)
    
    var postImagesUrlArray: [String] = []
    private let userProfileImage = UIImageView()
    private let userName = UILabel()
    private let userStatus = UILabel()
    private let moreActions = UIButton()
    private let postImages: UICollectionView
    private let postImagesLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    private let likeButton = UIButton()
    private let messageButton = UIButton()
    private let shareButton = UIButton()
    private let pinButton = UIButton()
    let pageControl = UIPageControl()
    private let likedByList = UILabel()
    private let postText = UILabel()
    private let postCreationTime = UILabel()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        postImages = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: postImagesLayout)

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    
        postImages.register(PostImageCell.self, forCellWithReuseIdentifier: PostImageCell.cellIdentifier)
        postImages.delegate = self
        postImages.dataSource = self
        configureUI()
    }
    
    func configureUI() {
        contentView.addSubview(userProfileImage)
        userProfileImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.width.height.equalTo(60)
        }
        
        userProfileImage.layer.borderWidth = 1
        userProfileImage.layer.borderColor = UIColor.black.cgColor
        userProfileImage.setRounded(imageRarius: 60)
        
        contentView.addSubview(userName)
        userName.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(userProfileImage.snp.centerY)
            make.left.equalTo(userProfileImage.snp.right).offset(10)
            make.top.equalTo(userProfileImage.snp.top)
            make.right.equalTo(contentView.snp.right).offset(30)
        }
        contentView.addSubview(userStatus)
        userStatus.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userProfileImage.snp.centerY)
            make.left.equalTo(userName.snp.left)
            make.bottom.equalTo(userProfileImage.snp.bottom)
            make.right.equalTo(contentView.snp.right).offset(30)
        }

        contentView.addSubview(moreActions)
        moreActions.snp.makeConstraints{ (make) -> Void in
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.centerY.equalTo(userProfileImage.snp.centerY)
            make.height.equalTo(5)
            make.width.equalTo(15)
        }
        moreActions.setImage(UIImage.init(named: "more_button"), for: .normal)

        let postImageCellHeight: CGFloat = 300
        postImagesLayout.scrollDirection = .horizontal
        postImagesLayout.itemSize = CGSize(width: contentView.frame.width, height: postImageCellHeight)
        postImagesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        postImagesLayout.minimumLineSpacing = 0
        
        postImages.showsVerticalScrollIndicator = false
        postImages.isPagingEnabled = true
        contentView.addSubview(postImages)
        postImages.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userProfileImage.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(postImageCellHeight)
        }

        pinButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        pinButton.addTarget(self, action: #selector(pinPost(_:)), for: .touchUpInside)
        contentView.addSubview(pinButton)
        pinButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.height.equalTo(20)
            make.width.equalTo(15)
        }

        likeButton.setImage(UIImage.init(named: "like_pressed"), for: .normal)
        likeButton.addTarget(self, action: #selector(likePost(_:)), for: .touchUpInside)
        contentView.addSubview(likeButton)
        likeButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.width.equalTo(20)
        }

        messageButton.setImage(UIImage.init(named: "message"), for: .normal)
        messageButton.addTarget(self, action: #selector(sendMessage(_:)), for: .touchUpInside)
        contentView.addSubview(messageButton)
        messageButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(likeButton.snp.right).offset(10)
            make.height.width.equalTo(20)
        }

        shareButton.setImage(UIImage.init(named: "share"), for: .normal)
        shareButton.addTarget(self, action: #selector(sharePost(_:)), for: .touchUpInside)
        contentView.addSubview(shareButton)
        shareButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(messageButton.snp.right).offset(10)
            make.height.width.equalTo(20)
        }

        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(contentView.center.x)
            make.centerY.equalTo(likeButton.snp.centerY)
        }

        contentView.addSubview(likedByList)
        likedByList.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(likeButton.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
        
        contentView.addSubview(postText)
        postText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(likedByList.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }

        postCreationTime.text = postCreationTime.text?.uppercased()
        postCreationTime.adjustsFontSizeToFitWidth = true
        postCreationTime.numberOfLines = 1
        contentView.addSubview(postCreationTime)
        postCreationTime.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(postText.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.bottom.equalToSuperview().offset(-10) // MOST IMPORTANT!!!!
        }
        
    }
    
    func updateCell(post: Post) {
        if let url = URL(string: post.userPhotoURL ?? "") {
            userProfileImage.kf.setImage(with: url)
        }
        
        userProfileImage.backgroundColor = UIColor.black
        userName.text = post.userName
        userStatus.text = post.userStatus
        
        postImagesUrlArray = post.postImages
        postImages.reloadData()
        
        
        pageControl.numberOfPages = postImagesUrlArray.count
        pageControl.currentPage = 0
        
        var liked_text = "Liked by"
        if let likes = post.likes {
            for like in likes {
                liked_text = liked_text + " \(like)"
            }
        }
        likedByList.text = liked_text
        postText.text = post.postText
        
        postCreationTime.text = post.created
    }
    
    // MARK: Cell views actions methods
    
    @objc func likePost(_ button: UIButton) {
       SCLAlertView().showInfo("Like pressed", subTitle: "You liked this post!")
    }
    
    @objc func sendMessage(_ button: UIButton) {
        SCLAlertView().showNotice("Message pressed", subTitle: "Do you want to send a message?")
    }
    
    @objc func sharePost(_ button: UIButton) {
        SCLAlertView().showSuccess("Share button pressed", subTitle: "Want to share this post?")
    }
    
    @objc func pinPost(_ button: UIButton) {
        SCLAlertView().showWarning("Pin button pressed", subTitle: "You pinned this post")
    }
    
}
