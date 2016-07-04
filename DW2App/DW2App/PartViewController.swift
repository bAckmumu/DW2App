//
//  PartViewController.swift
//  DW2App
//
//  Created by danqing liu on 16/7/3.
//  Copyright © 2016年 DW2. All rights reserved.
//

import UIKit

class PartViewController: UIViewController {

    @IBOutlet weak var ArtistButton: UIButton!
    @IBOutlet weak var ArtworkButton: UIButton!
    
    let weekend = "Participation"    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ArtistButton.layer.cornerRadius = 5
        ArtworkButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("Partshowing", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showArtists" {
            let viewController:ArtistsListTableViewController = segue.destinationViewController as! ArtistsListTableViewController
            
            viewController.weekend = weekend
            
        }
        else if segue.identifier == "showArtwork"
        {
            let vc = segue.destinationViewController as! ArtworkGalleryCollectionViewController
            
           
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
