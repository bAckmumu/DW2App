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
    let Products = ["annanatascha_art","kollmareva_art"]
    let imageArray = [UIImage(named:"kollmareva_art"),UIImage(named:"annanatascha_art")]
    var head_label: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
//       self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Products.count
    }
    
     func collectionView(collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                                                   atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "imageheader", forIndexPath: indexPath) as! CollectionReusableView
        headerView.headlabel.text = self.head_label
        headerView.headlabel.font = headerView.headlabel.font.fontWithSize(30)
        headerView.headlabel.textColor = UIColor.whiteColor()
     //  headerView.backgroundImage.backgroundColor = UIColor(patternImage: UIImage(named:"header1")!)
      
       headerView.backgroundColor = UIColor(patternImage: UIImage(named:"header1")!)
            return headerView
      
    }
   
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
             let collectionViewWidth = self.collectionView!.bounds.width
               let itemWidth = (collectionViewWidth - 4)/2.1
                       return CGSizeMake(itemWidth, itemWidth)
       // let cellSize:CGSize = CGSizeMake((collectionViewWidth - spacing * CGFloat(columnsNum-1))/CGFloat(columnsNum), 86)
        //return cellSize
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ViewCell
        
        cell.artworkImage?.image = self.imageArray[indexPath.row]
        cell.artworkImage.layer.cornerRadius = 10
       
      //  cell.artworkLabel?.text = self.Products[indexPath.row]
        cell.layer.cornerRadius = 10.0
        cell.backgroundColor = UIColor.init(red: 247, green: 247, blue: 247, alpha: 0.2)
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        return cell
        
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