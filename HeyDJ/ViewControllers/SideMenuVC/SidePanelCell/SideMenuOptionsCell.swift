//
//  SideMenuOptionsCell.swift
//  OnItsWayAgent
//
//  Created by Saurabh on 4/5/17.
//  Copyright © 2017 OnItsWay Inc. All rights reserved.
//

import UIKit

class SideMenuOptionsCell: UITableViewCell {
    @IBOutlet weak var menuItemLabel: UILabel!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.black
        self.selectionStyle = .none
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
