//
//  LogInViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/01.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1.textField return, 키보드 올리기
 2.tapGesture 추가
 3.iooutlet, action 메소드 추가
 4.navigationBarItem actino추가
 5.logIn 예외
 */

import UIKit
import Alamofire
import Firebase


class LogInViewController: UIViewController {
    
    @IBOutlet weak var textFieldToEmail: UITextField!
    
    @IBOutlet weak var textFieldToPassWord: UITextField!
    
    @IBAction func touchUpLoginButton(_ sender: Any) {
        logInToUser(email: textFieldToEmail.text, password: textFieldToPassWord.text)
        
    }
    
    @IBAction func touchUpToViewController(_ sender: Any) {
        textFieldToEmail.resignFirstResponder()
        textFieldToPassWord.resignFirstResponder()
        
    }
    
    
    @IBAction func touchUpLeftBarButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindForInitViewController", sender: nil)
    }
    
    @IBAction func touchUpPssWordForgotButton(_ sender: Any) {
        showCheckAlert(title: "확인", message: "지금은 서버 점검 중입니다ㅠㅠ")
    }
    
    @IBAction func touchUpApple(_ sender: Any) {
        showCheckAlert(title: "확인", message: "지금은 서버 점검 중입니다. 이메일 로그인을 이용해주세요!")
    }
    
    @IBAction func touchUpGoogle(_ sender: Any) {
        showCheckAlert(title: "확인", message: "지금은 서버 점검 중입니다. 이메일 로그인을 이용해주세요!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension LogInViewController{
    func isValid(email:String?, password:String?) -> Bool{
        if email != "" && password != ""{
            return true
        }
        else{
            return false
        }
    }
    
    func logInToUser(email: String?, password: String?){
        let isTextFieldValid = isValid(email: email, password: password)
        
        if isTextFieldValid{
            Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                //                 로그인한 uid 정보로 db에서 정보 찾아와서 userDefalults저장하기
                let uid = authResult?.user.uid
                
                DispatchQueue.global().async {
                    // roceivedUserInfoData -> userDefaultsSet
                    //self!.setUserInfo(uid: uid, email: email, name: nil, gender: nil, classfication: nil, score: nil, location: nil, anonymity: false)
                    self!.receivedUserInfoFromFireStore()
                    
                }
                self?.performSegue(withIdentifier: "segueForMainView", sender: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "확인", message: "아이디 및 비밀번호 입력란을 확인해주세요 :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
}
//---------------------divide-------------------------------//

class LogInNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor(hex: "#FAFBFD")
        self.navigationBar.shadowImage = UIImage()
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
