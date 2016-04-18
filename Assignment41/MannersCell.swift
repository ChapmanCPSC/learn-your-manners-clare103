//
//  MannersCell.swift
//  Assignment41
//
//  Created by David Clare on 4/12/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class MannersCell: UITableViewCell {
    
    
    @IBOutlet weak var mannersLbl: UILabel!
        
    @IBOutlet weak var mannersImg: UIImageView!
    
    var manners = Manners()
    
    var current_index = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(index: Int){
        
            mannersLbl.text = manners.manners_name[index]
            mannersImg.image = manners.manners_images[index]
      }
    
    
}
