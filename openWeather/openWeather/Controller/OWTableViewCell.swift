//
//  OWTableViewCell.swift
//  openWeather
//
//  Created by Federico Frias on 8/10/16.
//  Copyright © 2016 ffrias. All rights reserved.
//

import UIKit

class OWTableViewCell: UITableViewCell {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
