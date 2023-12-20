//
//  MainTabBar.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//


import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureTabBAr()
    }

// MARK: - Private Functions
    
    private func ConfigureTabBAr() {
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: FavoritesViewController())
      
        // add image
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "heart")
      
        // add title
        vc1.title = "Home"
        vc2.title = "Favorites"
       
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2], animated: true)
    }
}

