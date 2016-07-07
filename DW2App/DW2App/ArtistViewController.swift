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
    @IBOutlet var artistImage: UIImageView!
    
    @IBOutlet weak var toArtwork_Button: UIButton!
    var artist: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        nameImage.image = UIImage(named: artist + "_name")
        artistImage.image = UIImage(named: artist + "_artist")
        self.artistImage.contentMode = UIViewContentMode.ScaleAspectFit
        toArtwork_Button.setTitle("Kunstwerke", forState: UIControlState.Normal)
        toArtwork_Button.layer.cornerRadius = 5
        toArtwork_Button.backgroundColor = UIColor(red: 187/255, green: 14/255, blue: 25/255, alpha: 1)
        toArtwork_Button.tintColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
