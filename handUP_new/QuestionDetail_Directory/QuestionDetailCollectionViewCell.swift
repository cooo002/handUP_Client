//
//  QuestionDetailCollectionViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/09.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class QuestionDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var constraintToTopViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var constraintToBottomViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var viewToBottom: UIView!
    
    @IBOutlet weak var viewToTop: UIView!
    
    @IBOutlet weak var imageViewToQuestionUserProfileImg: UIImageView!
    
    @IBOutlet weak var labelToQuestionHeadLine: UILabel!
    
    @IBOutlet weak var labelToDate: UILabel!
    
    
    @IBOutlet weak var labelToQuestionUserID: UILabel!
    
    @IBOutlet weak var labelToNumOfQuestionUserAsking: UILabel!
    
    @IBOutlet weak var labelToNumOfAnswer: UILabel!
    @IBOutlet weak var labelToQuestionContents: UILabel!
    
    @IBOutlet weak var labelToQuestionKeyWordFirst: UILabel!
    
    @IBOutlet weak var labelToQuestionKeyWordSecond: UILabel!
    
    @IBOutlet weak var labelToQuestionKeyWordThird: UILabel!
    
    @IBOutlet weak var buttonToBottom: UIButton!
    
    var buttonClick:(()->Void)?// 굳이 필요없
    
    @IBAction func touchUpToButtonBottom(_ sender: Any) {
        NotificationCenter.default.post(name: .actinoToPerformSegue, object: nil, userInfo: ["data":"ok"])
    }
    
    @IBAction func touchUpToRecordQuestion(_ sender: Any) {
        // 나도 궁금해요 버튼 선택했을 때! 
    }
    
}
