//
//  ArtWorkViewController.swift
//  DW2App
//
//  Created by danqing liu on 16/7/5.
//  Copyright © 2016年 DW2. All rights reserved.
//

import UIKit

class ArtWorkViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ArtistButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    var viewController : ArtistViewController!

    
    var labelstring: String!
    /* func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
     let size = image.size
     
     let widthRatio  = targetSize.width  / image.size.width
     let heightRatio = targetSize.height / image.size.height
     
     // Figure out what our orientation is, and use that to form the rectangle
     var newSize: CGSize
     if(widthRatio > heightRatio) {
     newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
     } else {
     newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
     }
     
     // This is the rect that we've calculated out and this is what is actually used below
     let rect = CGRectMake(0, 0, newSize.width, newSize.height)
     
     // Actually do the resizing to the rect using the ImageContext stuff
     UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
     image.drawInRect(rect)
     let newImage = UIGraphicsGetImageFromCurrentImageContext()
     UIGraphicsEndImageContext()
     
     return newImage
     }*/

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       scrollView.delegate = self
        // scrollView.scrollEnabled = false
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 5
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        
        
        //self.ResizeImage(image, targetSize: CGSizeMake(200.0, 200.0))
        //  self.imageView.image = self.ResizeImage(image, targetSize: CGSizeMake(500, 500))
        self.imageView.image = self.image
        ArtistButton.setTitle(labelstring, forState: UIControlState.Normal)
               imageView.userInteractionEnabled = true
              let longPress=UILongPressGestureRecognizer(target:self,
                                                   action:#selector(longPressDid(_:)))
        
               imageView.addGestureRecognizer(longPress)
      
     //  viewController.artist = labelstring
        
        
    }
    func setData() {
        scrollView.zoomScale = 1
    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func longPressDid(sender: UILongPressGestureRecognizer){
        if sender.state == .Began {
            
            
            let optionMenu = UIAlertController(title: nil, message: "Save Picture", preferredStyle: .ActionSheet)
            
            
            let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction!) -> Void in
               
                let image = self.imageView.image!
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert: UIAlertAction!) -> Void in
                
            })
            
            optionMenu.addAction(saveAction)
            
            optionMenu.addAction(cancelAction)
            
            
            self.presentViewController(optionMenu, animated: true, completion: nil)
            
        } else {
            // let image = self.imageView.image!
            //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
}
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showArtist"
        {
            
            let viewController:ArtistViewController = segue.destinationViewController as! ArtistViewController
            
            viewController.artist = labelstring

          
            
            
            
        }
    }
    
}
