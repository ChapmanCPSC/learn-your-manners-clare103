//
//  EmailVC.swift
//  Assignment41
//
//  Created by David Clare on 4/24/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit
import MessageUI

class EmailVC: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var emailAddressTxt: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailAddressTxt.delegate = self
        
        if let email = NSUserDefaults.standardUserDefaults().valueForKey("email") as? String{
            emailAddressTxt.text = "\(email)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if isValidEmail(textField.text!)
        {
        NSUserDefaults.standardUserDefaults().setValue("\(emailAddressTxt.text!)", forKey: "email")
        NSUserDefaults.standardUserDefaults().synchronize()
        }
        else{
            print("error:invalid email")
        }
        textField.resignFirstResponder()
        return true
    }

    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
       
   
}
