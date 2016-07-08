//
//  PartViewController.swift
//  DW2App
//
//  Created by danqing liu on 16/7/3.
//  Copyright © 2016年 DW2. All rights reserved.
//

import UIKit

class PartViewController: UIViewController {

    @IBOutlet weak var Text: UITextView!
    @IBOutlet weak var ArtistButton: UIButton!
    @IBOutlet weak var ArtworkButton: UIButton!
    
    let weekend = "participation"    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonColor = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 0.8)
        ArtistButton.layer.backgroundColor = buttonColor.CGColor
        ArtworkButton.layer.backgroundColor = buttonColor.CGColor
        
        ArtworkButton.layer.cornerRadius = 2
        ArtistButton.layer.cornerRadius = 2
        Text.editable = false

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
            let viewController = segue.destinationViewController as! ArtistsListTableViewController
            viewController.weekend = weekend
        }
        else if segue.identifier == "showArtwork"
        {
            let vc = segue.destinationViewController as! ArtworkGalleryCollectionViewController
            vc.weekend = weekend
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
