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
        self.tabBar.tintColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    //    self.tabBar.selectedImageTintColor = UIColor.whiteColor()
        self.tabBar.barTintColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
       // self.tabBar.barTintColor = UIColor(red: 10/255, green: 10/255, blue: 10/255,alpha: 1)
              /*let view = ArtistsListTableViewController()
        let Tab_ArtistView = UINavigationController(rootViewController:view)
        Tab_ArtistView.tabBarItem = self.tabBar.items?[5]
        
        let view1 = ArtworkGalleryCollectionViewController()
        let Tab_ArtWorkView = UINavigationController(rootViewController:view1)
        Tab_ArtWorkView.tabBarItem = self.tabBar.items?[4]*/
        
        
        
    }
    
}