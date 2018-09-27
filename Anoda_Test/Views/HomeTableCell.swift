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

    var postImagesUrlArray: [String] = []
    
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
        
        pinButton.addTarget(self, action: #selector(pressPinButton(_:)), for: .touchUpInside)
        contentView.addSubview(pinButton)
        pinButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.height.equalTo(30)
            make.width.equalTo(20)
        }
        
        likeButton.addTarget(self, action: #selector(pressLikeButton(_:)), for: .touchUpInside)
        contentView.addSubview(likeButton)
        likeButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.width.equalTo(30)
        }
        
        messageButton.addTarget(self, action: #selector(pressMessageButton(_:)), for: .touchUpInside)
        contentView.addSubview(messageButton)
        messageButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(likeButton.snp.right).offset(10)
            make.height.width.equalTo(30)
        }
        
        shareButton.addTarget(self, action: #selector(pressShareButton(_:)), for: .touchUpInside)
        contentView.addSubview(shareButton)
        shareButton.snp.remakeConstraints{ (make) -> Void in
            make.top.equalTo(postImages.snp.bottom).offset(10)
            make.left.equalTo(messageButton.snp.right).offset(10)
            make.height.width.equalTo(30)
        }
        
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
    
    func updateCell(post: Post){
        if let url = URL(string: post.userPhotoURL ?? ""){
            userProfileImage.kf.setImage(with: url)
        }
        
        userProfileImage.backgroundColor = UIColor.black
        
        userName.text = post.userName
        userStatus.text = post.userStatus
        
        if let postPictures = post.postImages{
            postImagesUrlArray = postPictures
            postImages.reloadData()
        }
        
        pageControl.numberOfPages = postImagesUrlArray.count
        pageControl.currentPage = 0
        
        pinButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        
        likeButton.setImage(UIImage.init(named: "like_pressed"), for: .normal)
        
        messageButton.setImage(UIImage.init(named: "message"), for: .normal)
        
        shareButton.setImage(UIImage.init(named: "share"), for: .normal)
        
        var liked_text = "Liked by"
        if let likes = post.likes{
            for like in likes{
                liked_text = liked_text + " \(like)"
            }
        }
        likedByList.text = liked_text
        
        if let postDescription = post.postText{
            postText.text = postDescription
        }
        
        if let creationTime = post.created{
            postCreationTime.text = creationTime
        }
    }
    
    // MARK: Cell views actions methods
    
    @objc func pressLikeButton(_ button: UIButton) {
       SCLAlertView().showInfo("Like pressed", subTitle: "You liked this post!")
    }
    
    @objc func pressMessageButton(_ button: UIButton) {
        SCLAlertView().showNotice("Message pressed", subTitle: "Do you want to send a message?")
    }
    
    @objc func pressShareButton(_ button: UIButton) {
        SCLAlertView().showSuccess("Share button pressed", subTitle: "Want to share this post?")
    }
    
    @objc func pressPinButton(_ button: UIButton) {
        SCLAlertView().showWarning("Pin button pressed", subTitle: "You pinned this post")
    }
    
}
