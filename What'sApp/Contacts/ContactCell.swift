//
//  ContactCell.swift
//  What'sApp
//
//  Created by Abdo on 10/27/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
