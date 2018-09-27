//
//  JSONFileParser.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/27/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

class JSONFileParser{
    
    static let shared = JSONFileParser()
    
    init() {

    }
    
    func getLocalJSON() -> [Post]{
        var parsed_posts: [Post] = []
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let json = try JSONSerialization.data(withJSONObject: data, options: []) as? [String : Any]
//                print(json)
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    parsed_posts = posts
                } catch let error{
                    print(error)
                }
        } catch let error {
                // handle error
                print(error)
            }
    }
        return parsed_posts
    }
    
}
