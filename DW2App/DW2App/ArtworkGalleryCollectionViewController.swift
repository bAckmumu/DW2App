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
    var Artist: String!
    var groups = [String]()
    var artworks = [Artwork]()
    var names = [String]()
    var Count = 0
    var ArtWork_for_Artist = false
    var oneArtist: String!
    var artistKey: String!
    var Weekends = ["democracy","power","participation"]
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
        
        if ArtWork_for_Artist{
            if let artistsDict = artistsPlist {
                
                artistKey = artistsDict[oneArtist]!["key"]as! String
                let artistName = artistsDict[oneArtist]!["name"]as! String
                groups.append(artistKey)
                names.append(artistName)
                Count = groups.count
                
                if let artworkDict = artworkPlist{
                    
                    
                    
                    
                    for index in 0...Weekends.count-1 {
                        
                        let week = Weekends[index]
                        let imageCount = artworkDict[artistKey]![week] as! Int
                        
                        if imageCount>0{
                            
                            for i in 1...imageCount{
                                
                                
                                
                                
                                let artworkName = "\(artistKey)_\(week)_mini_\(i)"//artistKey + "_" + weekend + "_mini_" + (index as! String)
                                let artworkNameBig = "\(artistKey)_\(week)_\(i)"
                                
                                
                                let artwork = Artwork(name:artworkName,bigname:artworkNameBig,group: oneArtist)
                                artworks.append(artwork)
                                
                                
                                
                                
                            }
                        }
                        
                    }
                }
            }
            
        }
            
        else{
            
            
            if let festivalDict = festivalPlist {
                
                
                
                
                artistKeys = festivalDict[weekend] as! [String]
                
                if let artistsDict = artistsPlist {
                    
                    
                    for artistKey in artistKeys {
                        let artistName = artistsDict[artistKey]!["name"]! as! String
                        
                        
                        if weekend == "all" {
                            if let artworkDict = artworkPlist {
                                
                                Count = Count+1
                                groups.append(artistKey)
                                names.append(artistName)
                                
                                for index in 0...Weekends.count-1{
                                    
                                    let we = Weekends[index]
                                    let imageCount = artworkDict[artistKey]![we] as! Int
                                    
                                    if imageCount>0{
                                        
                                        for i in 1...imageCount {
                                            
                                            
                                            let artworkName = "\(artistKey)_\(we)_mini_\(i)"//artistKey + "_" + weekend + "_mini_" + (index as! String)
                                            let artworkNameBig = "\(artistKey)_\(we)_\(i)"
                                            
                                            
                                            let artwork = Artwork(name:artworkName,bigname:artworkNameBig,group: artistKey)
                                            artworks.append(artwork)
                                            
                                            print (artworkName)
                                        }
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                        else {
                            
                            
                            if let artworkDict = artworkPlist {
                                
                                let imageCount = artworkDict[artistKey]![weekend] as! Int
                                Count = Count + 1
                                groups.append(artistKey)
                                names.append(artistName)
                                
                                if imageCount > 0 {
                                    for index in 1...imageCount {
                                        
                                        let artworkName = "\(artistKey)_\(weekend)_mini_\(index)"//artistKey + "_" + weekend + "_mini_" + (index as! String)
                                        let artworkNameBig = "\(artistKey)_\(weekend)_\(index)"
                                        //let image = UIImage(named: artworkName)! as UIImage
                                        //artists[artistKey]!["Name"]! as! String
                                        //artists[] =
                                        Artist = artistKey
                                        
                                        let artwork = Artwork(name:artworkName,bigname:artworkNameBig,group: Artist)
                                        artworks.append(artwork)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        readArtworklist()
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return Count
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numbeOfRowsInEachGroup(section)
        
    }
    
    func numbeOfRowsInEachGroup(index: Int) -> Int {
        return artworksInGroup(index).count
    }
    
    func artworksInGroup(index: Int) -> [String] {
        let item = groups[index]
        var names = [String]()
        if artworks.count > 0 {
            for index in 0...artworks.count-1 {
                var group1 = ""
                group1 = artworks[index].group!
                //  let group1 = artworks[index].group
                if group1 == item{
                    
                    let name = artworks[index].name
                    names.append(name!)
                    
                }
            }
        }
        return names
    }
    
    func BigartworksInGroup(index: Int) -> [String] {
        let item = groups[index]
        var names = [String]()
        if artworks.count > 0 {
            for index in 0...artworks.count-1 {
                var group1 = ""
                group1 = artworks[index].group!
                //  let group1 = artworks[index].group
                if group1 == item{
                    
                    let name = artworks[index].bigname
                    names.append(name!)
                    
                }
            }
        }
        return names
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
        
        let names = artworksInGroup(indexPath.section)
        
        let name = names[indexPath.row]
        
        
        cell.artworkImage.image = UIImage(named:name)
        
        //    cell.artworkImage?.image = self.imageArray[indexPath.row]
        cell.artworkImage.layer.cornerRadius = 3
        
        //  cell.artworkLabel?.text = self.Products[indexPath.row]
        cell.layer.cornerRadius = 3.0
        // cell.backgroundColor = UIColor.init(red: 247, green: 247, blue: 247, alpha: 0.2)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        return cell
        
    }
    
    func gettGroupLabelAtIndex(index: Int) -> String {
        return names[index]
    }
    func collectionView(collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                                                          atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "imageheader", forIndexPath: indexPath) as! ReusableView
        headerView.section.text = gettGroupLabelAtIndex(indexPath.section)
        headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        return headerView
        
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
            vc.labelstring = self.groups[indexPath.section]

            let works = BigartworksInGroup(indexPath.section)
            
            let imagename = works[indexPath.row]
            let image1 = UIImage(named:imagename)!
            vc.image = image1
            
            // vc.image = self.imageArray[indexPath.row]
            //vc.ResizeImage(vc.image, targetSize: CGSizeMake(50.0, 200.0))
            //  vc.title = self.Products[indexPath.row]
            ArtWork_for_Artist = false
            
        }
    }
}

class Artwork {
    var name:String?
    var group:String?
    var bigname:String?
    
    init(name: String, bigname:String, group: String) {
        self.name = name
        self.bigname = bigname
        self.group = group
    }
}


