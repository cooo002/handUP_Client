//
//  ProfileClassViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/15.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. containerView constraints
 2. 현직자 등록
 - 현직자 등록 -> 학교 등록
 - registerAler(학교 이메일 등록하는 alert)
 */

import UIKit

class ProfileClassViewController: UIViewController {

    @IBOutlet weak var imageViewToClass: UIImageView!
    
    @IBOutlet weak var labelToClass: UILabel!
    
    @IBOutlet weak var labelToClassComent: UILabel!
    
    @IBOutlet weak var labelToNumOfQuestionOrAnswer: UILabel!
    
    @IBOutlet weak var labelToQuestionOrAnswer: UILabel!
    
    @IBOutlet weak var imageViewToProgress: UIImageView!
    
    @IBOutlet weak var labelToPercent: UILabel!
    
    @IBOutlet weak var buttonToRegisterOrAnswer
    : UIButton!
    
    @IBOutlet weak var buttonToQuestionOrAnswer: UIButton!
    
    @IBAction func touchUpToQuestionOrAnswer(_ sender: Any) {
        performSegue(withIdentifier: "segueForMyqaViewController", sender: nil)
    }
    
    @IBAction func touchUpToRegisterOrAsk(_ sender: Any) {
        //학교 등록인지 질문하러가기 인증 check하는 로직 필요
        initAlertForShoolEmail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let user = loadUerInfo()
        self.labelToClass.text = user.classes
        self.labelToNumOfQuestionOrAnswer.text = "0"
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var segueID = segue.identifier
        
        if segueID == "segueForMyqaViewController"{
            var destination = segue.destination
            destination.modalPresentationStyle = .fullScreen
        }
    }


}

extension ProfileClassViewController{
    func initAlertForShoolEmail(){
        var alert = UIAlertController(title: "회사인증", message: "회사 이메일을 입력해주세요 :)", preferredStyle: .alert)
        var ActionToOK = UIAlertAction(title: "확인", style: .default) {_ in
//            self.actinoToOK()
        }
        var ActionToCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addTextField { textField in
            textField.placeholder = "회사 이메일을 입력해주세요!"
        }
        
        alert.addAction(ActionToOK)
        alert.addAction(ActionToCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func actinoToOK(){
        let alert = UIAlertController(title: "확인", message: "현재 점겅을 위해 인증을 막아놨습니다 :)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print(" textField value Checking ---->\(alert.textFields?[0].text) ")

    }
}
