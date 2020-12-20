//
//  MainQuestionTabBarViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/08.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit
import Alamofire
/*
 check
 1. action(back o , finish, selectPhoto)
 2. containerView Embeded VC 접근방법 고민! x
 3. 질문완료했을 때 !!!
 */

class MainQuestionTabBarViewController: UIViewController {

    
    @IBAction func touchUpToBack(_ sender: Any) {
        performSegue(withIdentifier: "unwindForMainViewControllerWithSegue", sender: self)
        
    }
    
    @IBAction func tpuchUpToFinish(_ sender: Any) {
        //Netword Testing logic 
        let title = self.textFieldToHeadLine.text
        let contents = self.textViewToContent.text
        let keywords = self.textFieldToTag.text
        let keywordsArr = keywords?.components(separatedBy: ",")
        let isValidResult = isValid(title: title, contents: contents, tag: keywords)
        let isValidOfKeywordResult = isValidOfKeyword(keysords: keywords)
        
        if isValidResult{
            if isValidOfKeywordResult{
                if keywordsArr?.count == 3{
                DispatchQueue.global().async {
                    // 질문하기 완료
                    self.sendQuestionInfoToFireStore(title: title, contents: contents, keywords: keywordsArr)
                }
                self.performSegue(withIdentifier: "segueForComplete", sender: nil)
                }
                else{
                    showCheckAlert(title: "확인", message: "키워드는 꾝 3개를 입력해주셔야합니다!")
                }
            }
            else{
                showCheckAlert(title: "확인", message: "키워드를 구분하기 위해서는 ,가 필요해요!")
            }
        }
        else{
            showCheckAlert(title: "확인", message: "전부 입력해주세요 :)")
        }
    }
    
    @IBAction func touchUpToSelectPhoto(_ sender: Any) {
        openLibraray()
    }
    
    
    
    var pick = UIImagePickerController()
    
    @IBOutlet weak var textFieldToHeadLine: UITextField!
    
    @IBOutlet weak var textViewToContent: UITextView!
    
    @IBOutlet weak var textFieldToTag: UITextField!
    
    @IBOutlet weak var constraintsToTagBottom: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForComplete"{
            
            let destinationData = completeTitle(head: "질문하기 완료!", contents: "질문하기가 완료되었습다 ! 좀 더 자세한 질문을 하고싶다면 아래 1대1 질문하기 기능을 이용해 보세요 :)", topButtom: "1대1 질문하기", buttomButton: "메인화면으로 돌아가기")
            var destination = segue.destination as? CompleteViewController
            destination?.modalPresentationStyle = .fullScreen
            destination?.uiTitles = destinationData
        }
    }
    
}



extension MainQuestionTabBarViewController{
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(adjustTextFieldConstraintsToKeyboard(noti:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func adjustTextFieldConstraintsToKeyboard(noti: Notification){
        guard let userInfo = noti.userInfo else{
            fatalError()
        }
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            fatalError()
        }
        
        if noti.name == UIResponder.keyboardWillShowNotification{
            var keyboardHeight = (keyboardFrame.height - view.safeAreaInsets.bottom)
            constraintsToTagBottom.constant = keyboardHeight
        }
        
    }
}

extension MainQuestionTabBarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func openLibraray(){
        pick.sourceType = .photoLibrary
        present(pick, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.global().async {
            if let imageInfo = info[.originalImage] as? UIImage{
                //select Image
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func initSetting(){
        pick.delegate = self
        registerForKeyboardNotification()
        self.textFieldToHeadLine.becomeFirstResponder()
    }
}

extension MainQuestionTabBarViewController{
    func isValid(title:String?, contents:String?, tag:String?) -> Bool{
        if title != "" && contents != "" && tag != ""{
            return true
        }
        else{
            return false
        }
    }
    
    func isValidOfKeyword(keysords : String?) -> Bool{
        if let keywords = keysords?.range(of: ","){
            return true
        }
        else{
            return false
        }
    }
    
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

