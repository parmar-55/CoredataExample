//
//  SecondTableViewController.swift
//  Coredataexample
//
//  Created by apple on 23/11/22.
//

import UIKit
import CoreData
class SecondTableViewController: UITableViewController {

    var arr = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sname = ""
        var rno = ""
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
                request.returnsObjectsAsFaults = false
                do{
                    let result = try context.fetch(request)
                    for data in result{
                        sname = (data as AnyObject).value(forKey: "name") as! String
                       rno = (data as AnyObject).value(forKey: "rno") as! String
                        arr.append(rno + "" + sname)
                       
                    }
                }catch{
                      
                }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = arr[indexPath.row]

        return cell
    }
    

  

}
