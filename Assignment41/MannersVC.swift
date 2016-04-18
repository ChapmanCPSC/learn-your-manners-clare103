//
//  MannersVC.swift
//  Assignment41
//
//  Created by David Clare on 4/13/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class MannersVC: UIViewController {
    
    var index: Int = 0
    
    var new_manners = Manners()
    
    @IBOutlet weak var mannersImg: UIImageView!
    
    @IBOutlet weak var mannersDesc: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mannersImg.image = new_manners.manners_images[index]
        mannersDesc.text = new_manners.manners_desc[index]
        
    }
    
}
