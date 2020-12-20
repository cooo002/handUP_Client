//
//  QuestionDetailAnswerCollectionViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/09.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class QuestionDetailAnswerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var buttonToIndepthQuestion: UIButton!
    @IBOutlet weak var viewToTop: UIView!
    @IBOutlet weak var labelToAnswerUserID: UILabel!
    @IBOutlet weak var imageToAnswerUserProfileImg: UIImageView!
    
    @IBOutlet weak var labelToAnswerUserClass: UILabel!
    
    @IBOutlet weak var labelToAnswerUserMajorField: UILabel!
    
    @IBOutlet weak var labelToDate: UILabel!
    
    
    @IBOutlet weak var labelToAnswerContents: UILabel!
    
    var buttonClick:(()->Void)?
    
    @IBAction func touchUpToIndepthQuestion(_ sender: Any) {
        buttonClick?()
    }
    @IBAction func touchUpToAnswerUserMenu(_ sender: Any) {
    }
}
