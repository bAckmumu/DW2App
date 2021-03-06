//
//  ArtistsListTableViewController.swift
//  DW2App
//
//  Created by manu on 02.07.16.
//  Copyright © 2016 DW2. All rights reserved.
//

import UIKit

class ArtistsListTableViewController: UITableViewController {
    
    let all = "all"
    let artist = "artist"
    
    //var artists = [String: String]()
    var artistNames = [String]()
    var artistKeys = [String]()
    
    var weekend = "all"
    
    
    func readPropertyList(){
        var festivalPlist: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Festival", ofType: "plist") {
            festivalPlist = NSDictionary(contentsOfFile: path)
        }
        
        var artistsPlist: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Artists", ofType: "plist") {
            artistsPlist = NSDictionary(contentsOfFile: path)
        }
        
        if let festivalDict = festivalPlist {
            
            artistKeys = festivalDict[weekend] as! [String]
            
            if let artistsDict = artistsPlist {
                
                for artistKey in artistKeys {
                    let test = artistsDict[artistKey]!["name"]! as! String //artists[artistKey]!["Name"]! as! String
                    
                    artistNames.append(test) //(artists[artistKey])! as! String)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        readPropertyList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    /*
     override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 3
     }
     */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return artistNames.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = artistNames[indexPath.row]
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "showArtist" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let viewController:ArtistViewController = segue.destinationViewController as! ArtistViewController
            
            viewController.artistKey = artistKeys[(indexPath?.row)!]
            
        }
     }
    
    
}
