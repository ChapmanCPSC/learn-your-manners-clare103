//
//  Email.swift
//  Assignment41
//
//  Created by David Clare on 4/24/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import Foundation


class Email: NSObject, NSCoding {
    
    var _email: String?

    
    init (email: String){
    
        _email = email
    }
    
    override init(){
        
    }

    required convenience init?(coder aDecoder: NSCoder){
        self.init()
        self._email = (aDecoder.decodeObjectForKey("email") as? String)
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self._email, forKey: "email")
    }
    
}