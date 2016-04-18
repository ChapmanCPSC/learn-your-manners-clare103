//
//  ViewController.swift
//  Assignment41
//
//  Created by David Clare on 4/12/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mannersTable: UITableView!
   // var manners = [Manners]()
    var checked = [Bool](count: 9, repeatedValue: false)
    
    var _currentIndex: Int!
    
    var currentIndex: Int {
            return self._currentIndex
        }
    
   // @IBOutlet weak var mannersTitleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mannersTable.delegate = self
        mannersTable.dataSource = self

    }
    
    override func viewDidAppear(animated: Bool) {
       // fetchAndSetResults()
      //  mannersTable.reloadData()
    }

/*
    func fetchAndSetResults(){
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Manners")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.manners = results as! [Manners]
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
*/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let next_manners = manners[indexPath.row]
        
        if let cell = mannersTable.dequeueReusableCellWithIdentifier("MannersCell") as? MannersCell {
            cell.configureCell(indexPath.row)
            if !checked[indexPath.row]{
                cell.accessoryType = .None
            }
            else {
                cell.accessoryType = .Checkmark
            }
           // saveChecked(indexPath.row)
            return cell
        }
        else{
            return MannersCell()
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            if cell.accessoryType == .None{
                cell.accessoryType = .Checkmark
            }
        }
      //  saveChecked(indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "MannersSegue"){
            let mannersVC = segue.destinationViewController as? MannersVC
            
            let new_currentIndex = self.mannersTable.indexPathForSelectedRow
            _currentIndex = new_currentIndex!.row
            mannersVC?.index = currentIndex
        
        }
    }
    
 /*
    func saveChecked(index: Int) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("Manners", inManagedObjectContext: context)!
        let manners = Manners(entity: entity, insertIntoManagedObjectContext: context)
       // manners.mannersTitle = mannersTitleLbl.text

        if checked[index] == true {
            manners.mannersChecked = true
        }
        else if checked[index] == false {
            manners.mannersChecked = false
        }
        context.insertObject(manners)
        
        do {
            try context.save()
        } catch {
            print("Could not save manners")
        }
        
    }
    */
    
}
