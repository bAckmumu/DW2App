//
//  DemocracyViewController.swift
//  DW2App
//
//  Created by manu on 03.07.16.
//  Copyright © 2016 DW2. All rights reserved.
//

import UIKit


class DemocracyViewController: UIViewController {

    let weekend = "Democracy"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "artistsList" {
            let viewController:ArtistsListTableViewController = segue.destinationViewController as! ArtistsListTableViewController
            
            viewController.weekend = weekend
            
        } else if segue.identifier == "artworkGallery" {
        
        }
    }
    

}
