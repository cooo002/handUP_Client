//
//  SignUPInitViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/01.
//  Copyright © 2020 김재석. All rights reserved.
//

/*
 check
 1.  ActionToBack o
 2.  shadowEffect x
 
 */

import UIKit
import Alamofire


class SignUPInitViewController: UIViewController {
    
    @IBAction func touchUpSignApple(_ sender: Any) {
        showCheckAlert(title: "확인", message: "지금은 서버 점검 중입니다. 이메일 로그인을 이용해주세요!")
    }
    
    @IBAction func touchUpSignGoogle(_ sender: Any) {
        showCheckAlert(title: "확인", message: "지금은 서버 점검 중입니다. 이메일 로그인을 이용해주세요!")
    }
    
    @IBAction func touchUpSignEmail(_ sender: Any) {
        inputDataCheckingOfEmail()
    }
    
    @IBAction func touchUpViewController(_ sender: Any) {
        textFieldResignResponder(textField: self.textFieldToEmail)
        
    }
    
    @IBAction func touchUpToBackButton(_ sender: Any) {
//        performSegue(withIdentifier: "unwindForInitViewController", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var textFieldToEmail: UITextField!
    
    
    @IBOutlet weak var bottomConstraintsToLabel: NSLayoutConstraint!
    
    @IBOutlet weak var bottomConstraintsToEmailButton: NSLayoutConstraint!
    
    @IBOutlet weak var constraintsCenterYToApple: NSLayoutConstraint!
    
    @IBOutlet weak var viewToSignUpApple: UIView!
    
    @IBOutlet weak var viewSignUpGoogle: UIView!
    
    @IBOutlet weak var viewToSignUpEmailTextField: UIView!
    
    @IBAction func buttonToSignUpEmail(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForSignUP"{
            let destination = segue.destination as? SignUPViewController
            guard let text = self.textFieldToEmail.text else {
                return print("please write Email")
            }
            destination?.email = text
        }
    }
    
    
}

//-------------------------signUP Extension------------------------

extension SignUPInitViewController{
    func adjustShadowEffect(view:UIView){
        let shadowView  = UIView()
        let containerView = view
        //        shadowView.addSubview(containerView)
        
        
        containerView.layer.shadowColor = UIColor.red.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: containerView.frame.width, height: containerView.frame.height)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
        
        print(" value Checking ----> \(containerView)")
    }
    
    func inputDataCheckingOfEmail(){
        if textFieldToEmail.text != ""{
            performSegue(withIdentifier: "segueForSignUP", sender: nil)
        }
        else{
            let alert = UIAlertController(title: "확인", message: "회원가입을 할 이메일을 입력해주세 :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SignUPInitViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(adjustSignUpButtonConstraintsToKeyborad(noti:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustSignUpButtonConstraintsToKeyborad(noti:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func adjustSignUpButtonConstraintsToKeyborad(noti:Notification){
        guard let uerInfo = noti.userInfo else{
            fatalError()
        }
        
        guard let keyboardFrame = (uerInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            fatalError()
        }
        if noti.name == UIResponder.keyboardWillShowNotification{
            var keyboardHeght = (keyboardFrame.height - view.safeAreaInsets.bottom)
            //            let adjustConstant =
            constraintsCenterYToApple.constant = -(keyboardHeght - keyboardHeght/2)
        }
        else{
            constraintsCenterYToApple.constant = 0
        }
    }
}

class SignUPInitNavigationViewController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor(hex: "#FAFBFD")
        self.navigationBar.shadowImage = UIImage()
    }
}
