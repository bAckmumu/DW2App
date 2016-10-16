//
//  MachtViewController.swift
//  DW2App
//
//  Created by danqing liu on 16/7/3.
//  Copyright © 2016年 DW2. All rights reserved.
//

import UIKit

class MachtViewController: UIViewController {

    @IBOutlet weak var ArtistButton: UIButton!
    @IBOutlet weak var ArtworkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ArtworkButton.layer.cornerRadius = 5
        ArtistButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("Powershowing", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Powershowing"
        {
            let vc = segue.destinationViewController as! ArtworkGalleryCollectionViewController
            
            vc.head_label = "Macht"       }
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