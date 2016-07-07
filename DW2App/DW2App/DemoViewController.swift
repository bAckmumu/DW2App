//
//  DemoViewController.swift
//  DW2App
//
//  Created by danqing liu on 16/7/3.
//  Copyright © 2016年 DW2. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DemoViewController: UIViewController {

    
    @IBOutlet weak var ArtistButton: UIButton!
    @IBOutlet weak var ArtworkButton: UIButton!

    
    //@IBOutlet weak var Text: UITextView!
    let weekend = "democracy"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ArtworkButton.layer.cornerRadius = 5
        ArtistButton.layer.cornerRadius = 5
        //Text.editable = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ArtWorkAction(sender: UIButton) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showArtists" {
            let viewController = segue.destinationViewController as! ArtistsListTableViewController
            viewController.weekend = weekend
            
        }
        
        if segue.identifier == "showArtwork" {
            let vc = segue.destinationViewController as! ArtworkGalleryCollectionViewController
            vc.weekend = weekend
        }
        
        if segue.identifier == "showVideo"
        {
            let destination = segue.destinationViewController as! AVPlayerViewController
            //Change to match you video filename in supporting files
            let termsPath:String? = NSBundle.mainBundle().pathForResource("power", ofType: "mp4")!
            let url = NSURL(fileURLWithPath: termsPath!)
            destination.player = AVPlayer(URL: url)
            destination.player!.play()
        }
    }
        /*if segue.identifier == "Demoshowing"
        {
           let vc = segue.destinationViewController as! ArtworkGalleryCollectionViewController
          
                       
            vc.head_label = "Demokratie"       }
    }

    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
