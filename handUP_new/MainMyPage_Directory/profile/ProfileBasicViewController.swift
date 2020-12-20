//
//  ProfileBasicViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/15.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. profileImageSet o
 2. userDefaults o
 3. profileSelect -> Dispatch.global.Async o
 */


import UIKit

class ProfileBasicViewController: UIViewController {
    
    @IBOutlet weak var imageViewToProfile: UIImageView!
    
    @IBOutlet weak var labelToID: UILabel!
    
    @IBOutlet weak var tableViewToUserInfo: UITableView!
    
    @IBAction func touchUPToProfileChangeButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueForProgfileChangeViewController", sender: nil)
    }
    
    
    
    var picker = UIImagePickerController()
    
    
    var user :userInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initDataSetting()
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

extension ProfileBasicViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileBasicTableViewSetTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileBasicAnonymousSetTableViewCell", for: indexPath) as? ProfileBasicAnonymousSetTableViewCell else{
                return UITableViewCell()
            }
            cell.labelToSetTitle.text = profileBasicTableViewSetTitles[indexPath.row]
            cell.switchToAnonymousActivity.isOn = (self.user?.Anonymity)! ?? true
            return cell
        }
        else{
            
//            guard let userData = setToProfileBasicSetTableViewCellData(rowOfIndexpath: indexPath.row) else{
//                fatalError()
//            }
            let userData = setToProfileBasicSetTableViewCellData(rowOfIndexpath: indexPath.row)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileBasicSetTableViewCell", for: indexPath) as? ProfileBasicSetTableViewCell else{
                return UITableViewCell()
            }
            
            cell.labelToSetTitle.text = profileBasicTableViewSetTitles[indexPath.row]
            cell.labelToSetData.text = userData
            return cell
        }
    }
    
}

extension ProfileBasicViewController{
    func setToProfileBasicSetTableViewCellData(rowOfIndexpath: Int) -> String?{
        switch rowOfIndexpath {
        case 0:
            return self.user?.name ?? "미정"
        case 1:
            return self.user?.gender ?? "미정"
        case 2:
            return self.user?.classes ?? "미정"
        case 3:
            return self.user?.location ?? "미정"
        default:
            return "Complete"
        }
    }
}

extension ProfileBasicViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate{
    
    func initDataSetting(){
        setProfileImage(profileImageView: imageViewToProfile, key: userDefaultsKeys.profileImage.rawValue)
        self.user = loadUerInfo()
        self.labelToID.text = user?.email ?? "미정"
    }
}




