//
//  ViewController.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    let homeVC = HomeVC()
    let searchVC = SearchVC()
    let addPostVC = AddPostVC()
    let likesVC = LikesVC()
    let profileVC = ProfileVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        homeVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .bookmarks, tag: 0)
        searchVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .search, tag: 1)
        addPostVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .recents, tag: 2)
        likesVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .favorites, tag: 3)
        profileVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .contacts, tag: 4)
        self.tabBar.isTranslucent = false
        let controllers = [homeVC, searchVC, addPostVC, likesVC, profileVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        self.selectedIndex = 0
    }
    
}

