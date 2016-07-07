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
        let buttonColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        ArtistButton.layer.backgroundColor = buttonColor.CGColor
        ArtworkButton.layer.backgroundColor = buttonColor.CGColor

        ArtworkButton.layer.cornerRadius = 0
        ArtistButton.layer.cornerRadius = 0
        //Text.editable = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ArtWorkAction(sender: UIButton) {
        
    }
  /*  override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage =  UIImage()
        
       self.navigationController?.view.backgroundColor = UIColor.whiteColor()

       // self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.translucent = true
        super.viewWillAppear(animated)
        
    }*/
    
    
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
