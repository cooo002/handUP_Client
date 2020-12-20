//
//  ProfileKeywordViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/15.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class ProfileKeywordViewController: UIViewController {
    
    
    @IBOutlet weak var labelToInterest: UIButton!
    
    @IBOutlet weak var labelToKeyword: UIButton!
    
    @IBOutlet weak var labelToRegion: UIButton!
    
    @IBAction func touchUpToInterest(_ sender: Any) {
        AlertForIntersting(tiltle: "입력", contents: "흥미를 입력해주세요 :)", selecteButton: self.labelToInterest)
    }
    
    @IBAction func touchUpToKeyword(_ sender: Any) {
        AlertForIntersting(tiltle: "입력", contents: "관심 키워드를 입력해주세요 :)", selecteButton: self.labelToKeyword)
    }
    
    
    @IBAction func touchUpToRegion(_ sender: Any) {
        AlertForIntersting(tiltle: "입력", contents: "사는 지역을 입력해주세요 :)", selecteButton: self.labelToRegion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension ProfileKeywordViewController{
    func AlertForIntersting(tiltle: String?, contents: String?, selecteButton: UIButton){
        var alert = UIAlertController(title: tiltle, message: contents, preferredStyle: .alert)
        var ActionToOK = UIAlertAction(title: "확인", style: .default) {_ in
            selecteButton.titleLabel?.text = (alert.textFields?[0].text)!
        }
        var ActionToCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addTextField { textField in
            textField.placeholder = contents
        }
        
        alert.addAction(ActionToOK)
        alert.addAction(ActionToCancel)
        self.present(alert, animated: true, completion: nil)
    }
}
