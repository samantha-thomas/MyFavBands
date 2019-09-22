//
//  MasterViewController.swift
//  MyFavBands
//
//  Created by Samantha Thomas on 9/22/19.
//  Copyright © 2019 Samantha Thomas. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController
{

    var detailViewController: DetailViewController? = nil
    //var objects = [Any]()
    
    var listArray = NSMutableArray()


    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //navigationItem.leftBarButtonItem = editButtonItem

    /*
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController
        {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    */
        
        listArray = ["All Time Low", "Sleeping With Sirens","5 Seconds of Summer","Green Day","Waterparks", "My Chemical Romance","Simple Creatures", "Lamborghini Huracán", "St. Louis Cardinals", "Danny Phantom"]
        title = "My Favorite Bands"
        if let split = splitViewController
        {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool)
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    /*
        @objc
        func insertNewObject(_ sender: Any)
        {
            objects.insert(NSDate(), at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
     */

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                //Updated lines.
                let object = listArray[indexPath.row] as! String
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = (object as String) + ".jpg"
                controller.title = listArray[indexPath.row] as? String
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                self.splitViewController?.preferredDisplayMode = .primaryHidden
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //Updated line.
        return listArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = listArray[indexPath.row] as! NSString
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == .delete
            {
                objects.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert
            {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        }
    */
}

