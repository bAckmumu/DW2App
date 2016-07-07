//
//  InfoViewController.swift
//  DW2App
//
//  Created by manu on 07.07.16.
//  Copyright © 2016 DW2. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class InfoViewController: UIViewController {

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
    

}
