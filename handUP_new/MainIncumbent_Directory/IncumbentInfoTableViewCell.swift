//
//  IncumbentInfoTableViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/10/27.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class IncumbentInfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelToHead: UILabel!
    
    @IBOutlet weak var labelToInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
