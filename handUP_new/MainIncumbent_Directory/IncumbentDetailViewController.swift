//
//  IncumbentDetailViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/10/27.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class IncumbentDetailViewController: UIViewController {
    
    var userInfo : userInfo?
    
    @IBOutlet weak var imageViewToProfile: UIImageView!
    
    @IBOutlet weak var labelToID: UILabel!
    
    
    @IBAction func actionToIncumbentAnswer(_ sender: Any) {
        self.performSegue(withIdentifier: "segueForQuestionIncumbent", sender: nil)
    }
    
    
    
    @IBAction func actionToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initUserInfo()
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

extension IncumbentDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IncumbentInfoTableViewCell", for: indexPath) as? IncumbentInfoTableViewCell else{
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.labelToHead.text = "이름"
            cell.labelToInfo.text = userInfo?.name
            
        case 1:
            cell.labelToHead.text = "성별"
            cell.labelToInfo.text = userInfo?.gender
            
        case 2:
            cell.labelToHead.text = "계급"
            cell.labelToInfo.text = userInfo?.classes
            
        case 3:
            cell.labelToHead.text = "거주지역"
            cell.labelToInfo.text = userInfo?.location
            
        default:
            print("cellt init")
        }
        return cell
    }
}
extension IncumbentDetailViewController{
    func initUserInfo(){
        if UserDefaults.standard.objectIsForced(forKey: userDefaultsKeys.userInfo.rawValue) != nil{
            if let data = UserDefaults.standard.value(forKey: userDefaultsKeys.userInfo.rawValue) as? Data{
                let decoderUserInfo = try? PropertyListDecoder().decode(handUP_new.userInfo.self, from: data)
                self.userInfo = decoderUserInfo
            }
        }
    }
}
