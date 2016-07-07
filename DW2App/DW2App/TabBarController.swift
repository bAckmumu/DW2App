//
//  TabBarController.swift
//  DW2App
//
//  Created by danqing liu on 16/7/6.
//  Copyright © 2016年 DW2. All rights reserved.
//
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //  self.tabBar.tintColor = UIColor(red: 187/255, green: 14/255, blue: 25/255, alpha: 1)
        self.tabBar.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.tabBar.barTintColor = UIColor(red: 30/255, green: 30/255, blue: 30/255,alpha: 1)
        /*let view = ArtistsListTableViewController()
        let Tab_ArtistView = UINavigationController(rootViewController:view)
        Tab_ArtistView.tabBarItem = self.tabBar.items?[5]
        
        let view1 = ArtworkGalleryCollectionViewController()
        let Tab_ArtWorkView = UINavigationController(rootViewController:view1)
        Tab_ArtWorkView.tabBarItem = self.tabBar.items?[4]*/
        
        
        
    }
    
}