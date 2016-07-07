//
//  ArtworkGalleryCollectionViewController.swift
//  DW2App
//
//  Created by manu on 02.07.16.
//  Copyright © 2016 DW2. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class ArtworkGalleryCollectionViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
       var Products = [String]()
    var imageArray = [UIImage]()
    var weekend = "all"
    let artist = "Artist"
    var ArtImage : UIImage!
    //var artistNames = [String]()
    var artistKeys = [String]()
    var test1 = [String]()
    var test2 = [String]()
    
  //  var head_label: String!
    
    func readArtworklist(){
        
        
        var festivalPlist: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Festival", ofType: "plist") {
            festivalPlist = NSDictionary(contentsOfFile: path)
        }
        
        var artistsPlist: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Artists", ofType: "plist") {
            artistsPlist = NSDictionary(contentsOfFile: path)
        }
        
        var artworkPlist: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Artwork", ofType: "plist") {
            artworkPlist = NSDictionary(contentsOfFile: path)
        }

        
        if let festivalDict = festivalPlist {
            
            artistKeys = festivalDict[weekend] as! [String]
            
            if let artistsDict = artistsPlist {
                
                for artistKey in artistKeys {
                    let artistName = artistsDict[artistKey]!["name"]! as! String
                    
                    
                    if weekend == "all" {
                    
                    }
                    else {
                    
                    
                        if let artworkDict = artworkPlist {
                    
                            let imageCount = artworkDict[artistKey]![weekend] as! Int
                        
                            if imageCount > 0 {
                                for index in 1...imageCount {
                        
                                    let artworkName = "\(artistKey)_\(weekend)_mini_\(index)" //artistKey + "_" + weekend + "_mini_" + (index as! String)
                                    //let image = UIImage(named: artworkName)! as UIImage
                                    //artists[artistKey]!["Name"]! as! String
                                    //artists[] =
                    
                                    if let image = UIImage(named:artworkName) {
                                        Products.append(artistName)
                                        imageArray.append(image)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
        
//        var myDict: NSDictionary?
//        if let path = NSBundle.mainBundle().pathForResource("Festival", ofType: "plist") {
//            myDict = NSDictionary(contentsOfFile: path)
//        }
//        if let dict = myDict {
//            // Use your dict here
//            
//            //let artists = dict[artist] as! NSDictionary
//            
//            if weekend == "all" {
//                
//            }
//            
//            else if weekend == "Democracy" {
//              // Products = ["kollmareva","hofer"]
//                //imageArray = [UIImage(named:"kollmareva_art")!,UIImage(named:"hofer_art")!]
//                artistKeys = dict[weekend] as! [String]
//                
//                for artistKey in artistKeys {
//                    let artistName = dict[artist]![artistKey]!!["Name"]! as! String
//                    let artworkName = dict[artist]![artistKey]!!["Key"]! as! String + "_art"
//                  //let image = UIImage(named: artworkName)! as UIImage
//
//                    //artists[artistKey]!["Name"]! as! String
//                  
//                    //artists[] =
//                    Products.append(artistName)
//                    imageArray.append(UIImage(named:artworkName)!)
//                }
//            
//                
//                
//                
//            
//            }
//        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        readArtworklist()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Products.count
    }
    
    
   
   func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
             let collectionViewWidth = self.collectionView!.bounds.width
               let itemWidth = (collectionViewWidth - 4)/2.1
                       return CGSizeMake(itemWidth, itemWidth*1.2)
       // let cellSize:CGSize = CGSizeMake((collectionViewWidth - spacing * CGFloat(columnsNum-1))/CGFloat(columnsNum), 86)
        //return cellSize
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ViewCell
        
        cell.artworkImage?.image = self.imageArray[indexPath.row]
        cell.artworkImage.layer.cornerRadius = 3
       
      //  cell.artworkLabel?.text = self.Products[indexPath.row]
        cell.layer.cornerRadius = 3.0
       // cell.backgroundColor = UIColor.init(red: 247, green: 247, blue: 247, alpha: 0.2)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        return cell
        
    }



func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    self.performSegueWithIdentifier("ArtWorkDetail", sender: self)
}

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ArtWorkDetail"
    {
        
        let vc = segue.destinationViewController as! ArtWorkViewController
        let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
        let indexPath = indexPaths[0] as NSIndexPath
        vc.labelstring = self.artistKeys[indexPath.row]
        vc.ButtonTitle = self.Products[indexPath.row]
        vc.image = self.imageArray[indexPath.row]
        //vc.ResizeImage(vc.image, targetSize: CGSizeMake(50.0, 200.0))
      //  vc.title = self.Products[indexPath.row]

        
    }
}
}

  /*  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}*/
