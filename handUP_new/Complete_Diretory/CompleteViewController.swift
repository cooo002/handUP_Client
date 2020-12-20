//
//  QuestionCompleteViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/11.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. oultet, anction conect
 2. back Acntion completion ( 한번에 depth 2개 돌아가기), 
 */

import UIKit

class CompleteViewController: UIViewController {
    
    var uiTitles : completeTitle?
    
    
    @IBOutlet weak var labelToHeadLine: UILabel!
    
    @IBOutlet weak var labelToContents: UILabel!
    
    @IBOutlet weak var buttonToTop: UIButton!
    
    @IBOutlet weak var buttonToBottom: UIButton!
    
    @IBOutlet weak var imageViewToTop: UIImageView!
    
    
    @IBAction func touchUPToIndepthQuestion(_ sender: Any) {
        
    }
    
    @IBAction func touchUpToBackMain(_ sender: Any) {
        performSegue(withIdentifier: "unwindForMainViewControllerWithSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelToHeadLine.text = uiTitles?.headLineTitle
        labelToContents.text = uiTitles?.contentsTitle
//        buttonToTop.titleLabel?.text = uiTitles?.topButtonTitle
//        buttonToTop.titleLabel?.text = uiTitles?.bottomButtonTitle
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


