//
//  PostModel.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/27/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

struct Post: Codable {
    var userPhotoURL: String?
    var userName: String
    var userStatus: String?
    var postImages: [String]
    var likes: [String]?
    var postText: String
    var created: String
    
    enum CodingKeys: String, CodingKey {
        case userPhotoURL = "user_photo_url"
        case userName = "user_name"
        case userStatus = "user_status"
        case postImages = "post_images"
        case likes = "likes"
        case postText = "post_text"
        case created = "created"
    }
    
}
