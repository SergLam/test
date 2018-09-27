//
//  PostModel.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/27/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

struct Post {
    var userPhotoURL: String?
    var userName: String?
    var userStatus: String?
    var postImages: [String]?
    var likes: [String]?
    var postText: String?
    var created: String?
    
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


extension Post: Encodable
{
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userPhotoURL, forKey: .userPhotoURL)
        try container.encode(userName, forKey: .userName)
        try container.encode(userStatus, forKey: .userStatus)
        try container.encode(postImages, forKey: .postImages)
        try container.encode(likes, forKey: .likes)
        try container.encode(postText, forKey: .postText)
        try container.encode(created, forKey: .created)
    }
}

extension Post: Decodable
{
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userPhotoURL = try values.decode(String.self, forKey: .userPhotoURL)
        userName = try values.decode(String.self, forKey: .userName)
        userStatus = try values.decode(String.self, forKey: .userStatus)
        postImages = try values.decode([String].self, forKey: .postImages)
        likes = try values.decode([String].self, forKey: .likes)
        postText = try values.decode(String.self, forKey: .postText)
        created = try values.decode(String.self, forKey: .created)
    }
}
