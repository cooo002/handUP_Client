//
//  CustomUIViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/02.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

extension UIViewController{
    
    func textFieldResignResponder(textField: UITextField){
        textField.resignFirstResponder()
    }
}

extension UIViewController{
    func setProfileImage(profileImageView: UIImageView, key: String){
        DispatchQueue.global().async {
            if let profileImg = UserDefaults.standard.object(forKey: key) as? NSData{
                if let castingProfileImage = UIImage(data: profileImg as Data){
                    DispatchQueue.main.async{
                        profileImageView.image = castingProfileImage
                    }
                }
            }
        }
    }
}


extension UIViewController{
    
    func navigtionBarIsHidden(VC: UIViewController, bool: Bool){
        VC.navigationController?.navigationBar.isHidden = true
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
