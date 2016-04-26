//
//  ViewController.swift
//  Assignment41
//
//  Created by David Clare on 4/12/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, UIAlertViewDelegate {
    
    
    @IBOutlet weak var summaryBtn: UIButton!
    @IBOutlet weak var mannersTable: UITableView!
    
    var alertView = UIAlertView()
    var actionString: String?
    var body = ""
   
    
    var option: String?
    
    
   // var emailVC = EmailVC()
    
    var checked = [Bool](count: 9, repeatedValue: false)
    var manners = Manners()
    
    
    var _currentIndex: Int!
    var currentIndex: Int {
            return self._currentIndex
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mannersTable.delegate = self
        mannersTable.dataSource = self
       // mailVC.mailComposeDelegate = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = mannersTable.dequeueReusableCellWithIdentifier("MannersCell") as? MannersCell {
            cell.configureCell(indexPath.row)
            if !checked[indexPath.row]{
                cell.accessoryType = .None
            }
            else {
                cell.accessoryType = .Checkmark
            }
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
        if let cell = mannersTable.cellForRowAtIndexPath(indexPath) as? MannersCell{
            if cell.accessoryType == .None{
                cell.accessoryType = .Checkmark
                checked[indexPath.row] = true
                body += "\(manners.manners_name[indexPath.row])-\n\(manners.manners_desc[indexPath.row])\n\n"
                
            }
        }
     
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "MannersSegue"){
            let mannersVC = segue.destinationViewController as? MannersVC
            
            let new_currentIndex = self.mannersTable.indexPathForSelectedRow
            _currentIndex = new_currentIndex!.row
            mannersVC?.index = currentIndex
        
        }
    }
    
    func configuredMailVC() -> MFMailComposeViewController {
        
        let mailVC = MFMailComposeViewController()
        if let email = NSUserDefaults.standardUserDefaults().valueForKey("email") as? String {
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(["\(email)"])
        mailVC.setSubject("Learn your manners: Summary")
        mailVC.setMessageBody(self.body, isHTML: false)
        }
        
        return mailVC
        
    }
    
    func showMailError() {
        let sendMailError = UIAlertView(title: "Could not send email", message: "Your device could not send e-mail. Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailError.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            print("cancelled mail")
            break
        case MFMailComposeResultSent.rawValue:
            print("sent")
            break
        case MFMailComposeResultFailed.rawValue:
            print("failed")
            break
        default:
            break
            
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    @IBAction func sendSummary(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(self.configuredMailVC(), animated: true, completion: nil)
            
        }else {
            self.showMailError()
        }

    
    }
    
    
    
}
