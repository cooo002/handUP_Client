//
//  ProfileChangeViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/12/01.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class ProfileChangeViewController: UIViewController {
    
    // 각 cell의 data가 변경되지 않았을 때 기본값 저장하기
    
    
    @IBAction func touchUPToBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUPToProfileChangeComplete(_ sender: Any) {
        let uidOfAuth = Auth.auth().currentUser?.uid
        let emailOfAuth = Auth.auth().currentUser?.email
        
        setUserInfo(uid: uidOfAuth, email: emailOfAuth, name: self.name, gender: self.gender, classfication: self.user?.classfication, score: self.user?.score, location: self.location, anonymity: self.anoymity)
        defer {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var imageViewToProfile: UIImageView!
    
    @IBOutlet weak var labelToID: UILabel!
    
    @IBOutlet weak var tableViewToUserInfo: UITableView!
    
    
    var picker = UIImagePickerController()
    
    var name  = "testing"
    
    var gender = "testing"
    
    var location = "testing"
    
    var anoymity = false
    
    var user :userInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        initViewDataSetting()
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


extension ProfileChangeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileBasicTableViewSetTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileChangeAnonymousSetTableViewCell", for: indexPath) as? ProfileChangeAnonymousSetTableViewCell else{
                return UITableViewCell()
            }
            self.anoymity = (self.user?.Anonymity)! ?? true
            cell.labelToSetTitle.text = profileBasicTableViewSetTitles[indexPath.row]
            cell.switchToAnonymousActivity.isOn = self.anoymity
            return cell
        }
        else{
            
            let userData = setToProfileBasicSetTableViewCellData(rowOfIndexpath: indexPath.row)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileChangeSetTableViewCell", for: indexPath) as? ProfileChangeSetTableViewCell else{
                return UITableViewCell()
            }
            
            cell.labelToSetTitle.text = profileBasicTableViewSetTitles[indexPath.row]
            cell.labelToSetData.text = userData
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // select Cell init
        // 
        guard var cell = tableView.cellForRow(at: indexPath) as? ProfileChangeSetTableViewCell else{
            fatalError()
        }
        selectOftableviewAction(rowOfIndexPath: indexPath, selectCell: cell)
        
        print(cell.labelToSetData)
    }
    
    func selectOftableviewAction(rowOfIndexPath: IndexPath, selectCell: ProfileChangeSetTableViewCell){
        // select Cell paramiter
        
        switch rowOfIndexPath.row {
        case 0:
            initAlerController(title: "이름을 입력해주세요!", alertStyle: .alert, selectCell: selectCell, row: rowOfIndexPath.row){ cell in
                cell.labelToSetData.text = self.name
            }
        case 1:
            initAlerController(title: "성별을 골라주세요!", alertStyle: .actionSheet,selectCell: selectCell, row: rowOfIndexPath.row){ cell in
                cell.labelToSetData.text = self.gender
            }
        case 3:
            initAlerController(title: "거주지역을 입력해주세요!", alertStyle: .alert,selectCell: selectCell, row: rowOfIndexPath.row){ cell in
                cell.labelToSetData.text = self.location
            }
        default:
            print("defaults")
        }
        
    }
}

extension ProfileChangeViewController{
    func setToProfileBasicSetTableViewCellData(rowOfIndexpath: Int) -> String?{
        switch rowOfIndexpath {
        case 0:
            self.name = self.user?.name ?? "미정"
            return self.name
        case 1:
            self.gender = self.user?.gender ?? "미정"
            return self.gender
        case 2:
            return self.user?.classes ?? "미정"
        case 3:
            self.location = self.user?.location ?? "미정"
            return self.location
        default:
            return "Complete"
        }
        
    
    }
}

extension ProfileChangeViewController{
    func initAlerController(title: String, alertStyle: UIAlertController.Style , selectCell: ProfileChangeSetTableViewCell, row : Int,  completionHandler:  @escaping (ProfileChangeSetTableViewCell) -> Void){
        
        //indextpath 별 분기
        switch alertStyle {
        case .alert:
            var alerController = UIAlertController(title: title, message: nil, preferredStyle: alertStyle)
            var alertActionOfCancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            var alertActionOfComplete : UIAlertAction?
        
            switch row {
            case 0: // profile name
                alertActionOfComplete = UIAlertAction(title: "확인", style: .default){_ in
                    DispatchQueue.global().async {
                        DispatchQueue.main.async {
                            // data 저장부분 확인
                            self.name = (alerController.textFields?[0].text)!
                            completionHandler(selectCell)
                            print("input Data -> \(alerController.textFields?[0].text)")
                        }
                    }
                }
            case 3:// profile location
                alertActionOfComplete = UIAlertAction(title: "확인", style: .default){_ in
                    DispatchQueue.global().async {
                        DispatchQueue.main.async {
                            // data 저장부분 확인
                            self.location = (alerController.textFields?[0].text)!
                            completionHandler(selectCell)
                            print("input Data -> \(alerController.textFields?[0].text)")
                        }
                    }
                }
            default:
                print("profile Data Change !! ")
            }
            alerController.addTextField { textField in
                textField.placeholder = title
            }
            
            alerController.addAction(alertActionOfComplete!)
            alerController.addAction(alertActionOfCancle)
            present(alerController, animated: true, completion: nil)
            
        case .actionSheet:
            var alerController = UIAlertController(title: title, message: nil, preferredStyle: alertStyle)
            
            var alertActionOfMale = UIAlertAction(title: "남자", style: .default){_ in
                
                DispatchQueue.global().async {
                    self.gender = "남"
                    DispatchQueue.main.async {
                        completionHandler(selectCell)
                        print("select Male")
                    }
                    
                }
            }
            var alertActionOfFemale = UIAlertAction(title: "여자", style: .default){_ in
                DispatchQueue.global().async {
                    self.gender = "여"
                    DispatchQueue.main.async {
                        completionHandler(selectCell)
                        print("selecte Female")
                    }
                }
            }
            
            alerController.addAction(alertActionOfMale)
            alerController.addAction(alertActionOfFemale)
            present(alerController, animated: true, completion: nil)
            
        default:
            print("initAlerInit")
        }
        
    }
}


extension ProfileChangeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate{
    
    func initViewDataSetting(){
        setProfileImage(profileImageView: imageViewToProfile, key: userDefaultsKeys.profileImage.rawValue)
        self.user = loadUerInfo()
        self.labelToID.text = user?.email ?? "미정"
        
        var tapGesture = UITapGestureRecognizer(target: self, action: #selector(showGallery))
        self.imageViewToProfile.addGestureRecognizer(tapGesture)
        self.imageViewToProfile.isUserInteractionEnabled = true
        picker.delegate = self
        
    }
    
    @objc func showGallery(){
        print("setGesture")
        openLibray()
    }
    
    func openLibray(){
        self.picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func openCamera(){
        self.picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.global().async {
            var userCoreData = UserDefaults.standard
            if let profileImg = info[.originalImage] as? UIImage{
                let profileImgJpeg = profileImg.jpegData(compressionQuality: 0.1)
                userCoreData.set(profileImgJpeg, forKey: userDefaultsKeys.profileImage.rawValue)
                userCoreData.synchronize()
                
                DispatchQueue.main.async {
                    self.imageViewToProfile.image = profileImg
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
}







