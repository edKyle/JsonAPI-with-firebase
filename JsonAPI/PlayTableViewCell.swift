//
//  PlayTableViewCell.swift
//  JsonAPI
//
//  Created by Kyle on 2016/6/21.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class PlayTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var serve: UILabel!
    @IBOutlet weak var cat: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
