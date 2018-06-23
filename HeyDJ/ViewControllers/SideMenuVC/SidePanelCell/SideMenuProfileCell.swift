//
//  SideMenuProfileCell.swift
//  OnItsWayAgent
//
//  Created by Saurabh on 4/5/17.
//  Copyright © 2017 OnItsWay Inc. All rights reserved.
//

import UIKit

class SideMenuProfileCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profilePicButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profilePicButton.layer.cornerRadius = profilePicButton.frame.height/2
        profilePicButton.clipsToBounds = true
        self.profilePicButton.layer.borderWidth = 2.0
        self.profilePicButton.layer.borderColor = UIColor.white.cgColor
        self.contentView.backgroundColor = UIColor.black
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
