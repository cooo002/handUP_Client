//
//  WriteAnswerViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/11.
//  Copyright © 2020 김재석. All rights reserved.
//

/*
 check
 1. back Action (unwind)
 2. photo
 3. finish
 4. questionView(actionSheet)
 4. keyboard(always Visiable) o
 5. 답변 작성 후 fireStore에 등록하기 x
 -collection(questionRelation).document(questionUID).collection(answer).document(answerUID).filed(Dictionary 타입 데이터)
 -answerInfo Structure
 -userPostInfo Update 
 -qustionUID를 이용해서 questioRelation에 등록
 
 */

import UIKit

class WriteAnswerViewController: UIViewController {
    var questionUid : String?

    @IBOutlet weak var constraintsToTextViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var textViewToWriteAnswer: UITextView!
    
    @IBAction func touchUpToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpToPhoto(_ sender: Any) {
    }
    
    @IBAction func touchUpToFinish(_ sender: Any) {
        let contentsData = self.textViewToWriteAnswer.text
        
        DispatchQueue.global().async {
            self.sendAnswerInfoToQuestionRalationCollection(questionUid: self.questionUid, contents: contentsData)
        }
    }
    
    @IBAction func touchUpToViewQuestion(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" value Checking writeVC questionUid----> \(self.questionUid)")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initKeyboardVisiable()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForComplete"{
            let destinationData = completeTitle(head: "답변하기 완료!", contents: "답변작성을 완료하였습니다! 이제 질문자의 채택을 기다리는 일만 남았어요  :)", topButtom: "다른 질문에 답변하러 가기", buttomButton: "메인화면으로 돌아가기")
            var destination = segue.destination as? CompleteViewController
            destination?.modalPresentationStyle = .fullScreen
            destination?.uiTitles = destinationData
        }
    }
    
}

extension WriteAnswerViewController{
    func initKeyboardVisiable(){
        textViewToWriteAnswer.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustKeyboardConstraints(noti:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func adjustKeyboardConstraints(noti: Notification){
        guard let userInfo = noti.userInfo else{
            fatalError()
        }
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            fatalError()
        }
        
        if noti.name == UIResponder.keyboardWillShowNotification{
            var keyboardHeight = (keyboardFrame.height - view.safeAreaInsets.bottom)
            constraintsToTextViewBottom.constant = keyboardHeight
        }
    }
}
