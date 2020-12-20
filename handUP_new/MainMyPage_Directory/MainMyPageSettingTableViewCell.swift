//
//  MainMyPageSettingTableViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/09.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class MainMyPageSettingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewToSetting: UIImageView!
    
    @IBOutlet weak var labelToSettingName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
