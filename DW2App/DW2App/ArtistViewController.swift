//
//  ArtistViewController.swift
//  DW2App
//
//  Created by manu on 04.07.16.
//  Copyright © 2016 DW2. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {

    @IBOutlet var nameImage: UIImageView!
    @IBOutlet var text: UITextView!
    
    @IBOutlet weak var toArtwork_Button: UIButton!
    var artistKey: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        nameImage.image = UIImage(named: artistKey + "_name")
        
        toArtwork_Button.setTitle("Kunstwerke", forState: UIControlState.Normal)
        toArtwork_Button.layer.cornerRadius = 15
        toArtwork_Button.backgroundColor = UIColor(red: 187/255, green: 14/255, blue: 25/255, alpha: 0.8)
        toArtwork_Button.tintColor = UIColor.whiteColor()
        
        
        if let path = NSBundle.mainBundle().pathForResource(artistKey, ofType: "txt") {
            let contents: NSString
            do {
                contents = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            } catch _ {
                contents = ""
            }
        
            text.text  = contents as String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "showArtwork" {
            let vc = segue.destinationViewController as! ArtworkGalleryCollectionViewController
            vc.oneArtist = artistKey
            
            vc.ArtWork_for_Artist = true
            
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
