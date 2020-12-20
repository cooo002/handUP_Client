//
//  QuestionIncumbentViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/10/27.
//  Copyright © 2020 김재석. All rights reserved.
//

/*
 check
 1. keyboardHeight
 2. photo
 3. complete
 4. textView PlaceHolder
 */

import UIKit

class QuestionIncumbentViewController: UIViewController {
    
    
    @IBOutlet weak var constraintsToTagBottom: NSLayoutConstraint!
    
    @IBAction func touchUpToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpToComplete(_ sender: Any) {
        self.performSegue(withIdentifier: "segueForComplete", sender: nil)
    }
    
    @IBAction func touchUpToPhoto(_ sender: Any) {
    }
    
    @IBOutlet weak var textFieldToHeadLine: UITextField!
    
    @IBOutlet weak var textViewToConent: UITextView!
    
    @IBOutlet weak var textFieldToTag: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.textFieldToHeadLine.becomeFirstResponder()
        registerForKeyboardNotification()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForComplete" {
            var VC = segue.destination as? CompleteViewController
            let destinationData = completeTitle(head: "질문하기 완료!", contents: "질문하기가 완료되었습다 ! 좀 더 자세한 질문을 하고싶다면 아래 1대1 질문하기 기능을 이용해 보세요 :)", topButtom: "1대1 질문하기", buttomButton: "메인화면으로 돌아가기")
            VC?.uiTitles = destinationData
//
//            VC?.labelToHeadLine.text = "질문하기 완료!"
//            VC?.labelToContents.text = "현직자에게 질문을 보냈습니다! 이제 답이 올 때 까지 기다리는 일만 남았습니다 :)"
//            VC?.buttonToTop.titleLabel?.text = "나와 비슷한 질문들 보러가기"
//            VC?.buttonToBottom.titleLabel?.text = "다른 현직자에게도 질문하기"
        }
    }
}

extension QuestionIncumbentViewController{
    
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(adjustTextFieldConstraintsToKeyboard(noti:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc  private func adjustTextFieldConstraintsToKeyboard(noti:Notification){
        guard let userInfo = noti.userInfo else{
            fatalError()
        }
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            fatalError()
        }
        if noti.name == UIResponder.keyboardWillShowNotification{
            var keyboardHeight = (keyboardFrame.height - view.safeAreaInsets.bottom)
            constraintsToTagBottom.constant = keyboardHeight
        }
        else{
            
        }
    }
}
