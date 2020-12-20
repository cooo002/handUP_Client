//
//  ProfileChangeTableViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/12/01.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class ProfileChangeSetTableViewCell: UITableViewCell {
    @IBOutlet weak var labelToSetTitle: UILabel!
    
    @IBOutlet weak var labelToSetData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class ProfileChangeAnonymousSetTableViewCell: UITableViewCell {
    @IBOutlet weak var labelToSetTitle: UILabel!

    @IBOutlet weak var switchToAnonymousActivity: UISwitch!
    @IBAction func valueChangedToAnonymousActivity(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        switchToAnonymousActivity.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
