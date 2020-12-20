//
//  ProfileTopCustomCollectionViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/15.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class ProfileTopCustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewToBottom: UIView!
    
    @IBOutlet weak var labelToName: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                labelToName.textColor = .black
                viewToBottom.backgroundColor = hexStringToUIColor(hex: "#30BDDC")
            }
            else{
                labelToName.textColor = .lightGray
                viewToBottom.backgroundColor = hexStringToUIColor(hex: "#D3F1F8")
            }
        }
    }
}


