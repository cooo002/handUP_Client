//
//  MainMyPageViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/04.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. image 설정( profile, settingImage) o
 */
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class MainMyPageViewController: UIViewController {
    
    @IBOutlet weak var imageViewToProfile: UIImageView!
    
    @IBOutlet weak var labelToID: UILabel!
    
    @IBOutlet weak var labelToClass: UILabel!
    
    @IBOutlet weak var labelToCredit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setProfileImage(profileImageView: imageViewToProfile, key: userDefaultsKeys.profileImage.rawValue)
        let user = loadUerInfo()
        self.labelToID.text = user.email
        self.labelToClass.text = user.classes
        self.labelToCredit.text = "0"
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

extension MainMyPageViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMyPageSettingTableViewCell", for: indexPath) as? MainMyPageSettingTableViewCell else{
            return UITableViewCell()
        }
        var settingName = settingContents[indexPath.row]
        cell.labelToSettingName.text = settingName
        cell.imageViewToSetting.image = settingContentsDic[settingName] as! UIImage
        if indexPath.row == 4{
            cell.labelToSettingName.textColor = hexStringToUIColor(hex: "#EA4335")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 44)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectAcitonTosetting(row: indexPath.row)
    }
}

extension MainMyPageViewController{
    func selectAcitonTosetting(row:Int){
        switch row {
        case 0:
            print("-\(row) Cell select-")
            //            performSegue(withIdentifier: "segueForProfile", sender: self)
            var storyboard = UIStoryboard(name: "Profile", bundle: nil)
            var VC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
            VC?.modalPresentationStyle = .fullScreen
            self.present(VC!, animated: true, completion: nil )
        case 1:
            print("-\(row) Cell select-")
            var storyboard = UIStoryboard(name: "Credit", bundle: nil)
            var VC = storyboard.instantiateViewController(withIdentifier: "CreditViewController") as? CreditViewController
            VC?.modalPresentationStyle = .fullScreen
            self.present(VC!, animated: true, completion: nil )
            
        case 2:
            print("-\(row) Cell select-")
            var storyboard = UIStoryboard(name: "MyQA", bundle: nil)
            var VC = storyboard.instantiateViewController(withIdentifier: "MyqaViewController") as? MyqaViewController
            VC?.modalPresentationStyle = .fullScreen
            self.present(VC!, animated: true, completion: nil )
            
        case 3:
            print("-\(row) Cell select-")
        case 4:
            changedToWindowRootViewController(storyboard: "Init", viewController: "InitViewController")
            DispatchQueue.global().async {
                self.currentUserLogOut()
            }
            print("-\(row) Cell select-")
        default:
            print("cellSelected")
        }
    }
}

extension MainMyPageViewController{
    
    func changedToWindowRootViewController(storyboard: String, viewController: String){
        // 1. parameter로 appdelegate window 접근 -> window Storyboard 교체 -> 화면 뿌려주기
        var appDelegate = UIApplication.shared.delegate as? AppDelegate
        var window = appDelegate?.window
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: viewController)
        window?.rootViewController = VC
        window?.makeKeyAndVisible()
    }
    
    func currentUserLogOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
