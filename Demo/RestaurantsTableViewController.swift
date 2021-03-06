//
//  RestaurantsTableViewController.swift
//  Demo
//
//  Created by Ludovic Ollagnier on 23/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {

    let restoManager = RestaurantManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        NSNotificationCenter.defaultCenter().addObserverForName(RestaurantManager.Constants.modelUpdatedNotificationName, object: nil, queue: NSOperationQueue.mainQueue()) { (note) -> Void in
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restoManager.allRestaurants.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestoCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = restoManager.allRestaurants[indexPath.row].name
        cell.detailTextLabel?.text = restoManager.allRestaurants[indexPath.row].adress

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetails" {

            guard let cell = sender as? UITableViewCell else {
                return
            }

            guard let indexPath = tableView.indexPathForCell(cell) else {
                return
            }

            if let vc = segue.destinationViewController as? DetailsViewController {
                vc.aRestaurant = restoManager.allRestaurants[indexPath.row]
            }
        }
    }
}
