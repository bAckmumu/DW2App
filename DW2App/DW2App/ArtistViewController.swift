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
    
    var artist: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        nameImage.image = UIImage(named: artist + "_name")
        artistImage.image = UIImage(named: artist + "_artist")
        
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
