
//
//  Custom.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/01.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}


extension UICollectionViewDelegateFlowLayout{
    func returnCellSize(width:CGFloat, height:CGFloat) -> CGSize{
        return CGSize(width: width, height: height)
    }
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


extension UIApplication {
    class var statusBarView: UIView? {
        var statusBarView: UIView?
        if #available(iOS 13.0, *) {
            let tag = 38482458385 // 태그를 지정하는 것!
            if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag){
                statusBarView = statusBar
            }
            else {
                let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBar.tag = tag
                UIApplication.shared.keyWindow?.addSubview(statusBar)
                statusBarView = statusBar
            }
        } else {
            statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
        }
        return statusBarView
    } 
    
    class var statusBarBackgroundColor: UIColor? {
        get
        {
            return statusBarView?.backgroundColor
        }
        set
        {
            statusBarView?.backgroundColor = newValue
        }
    }
    
    class var statusBarTintColor: UIColor? {
        get
        {
            return statusBarView?.tintColor
        }
        set
        {
            statusBarView?.tintColor = newValue
        }
    }
}

func returnStringOfNow() -> String{
    let now  = Date()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter.string(from: now)
}




//extension UITableViewDelegate{
//    
//    func returnToTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, castingTableCell: UITableViewCell, cellIdentifier: String) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? castingTableCell else{
//            return UITableViewCell()
//        }
//        return cell
//    }
//}
