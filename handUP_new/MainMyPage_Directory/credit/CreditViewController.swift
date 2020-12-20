//
//  CreditViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/12/04.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController {

    @IBOutlet weak var touchUpToBack: UIButton!
    
    @IBAction func touchUpToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageViewToProfile: UIImageView!
    
    @IBOutlet weak var labelToEmail: UILabel!
    
    @IBOutlet weak var labelToClass: UILabel!
    
    @IBOutlet weak var labelToCredit: UILabel!
    
    @IBAction func touchUPToCharge(_ sender: Any) {
        showCheckAlert(title: "확인", message: "기능을 준비 중 입니다 :)")
    }
    @IBAction func touchUptoRefund(_ sender: Any) {
        showCheckAlert(title: "확인", message: "기능을 준비 중 입니다 :)")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let user = loadUerInfo()
        self.labelToEmail.text = user.email
        self.labelToClass.text = user.classes
        setProfileImage(profileImageView: imageViewToProfile, key: userDefaultsKeys.profileImage.rawValue)
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

extension CreditViewController{
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
