//
//  QuestionAlertViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/23.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class QuestionAlertViewController: UIViewController {

    @IBOutlet weak var labelToHeadLine: UILabel!
    
    @IBOutlet weak var labelToContents:
        UILabel!
    
    @IBOutlet weak var buttonToAction:
        UIButton!
    
    @IBAction func touchUpToAction(_ sender: Any){
        performSegue(withIdentifier: "segueForMainTabBarController", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueID = segue.identifier
        if segueID == "segueForMainTabBarController"{
            let destination = segue.destination
            destination.modalPresentationStyle = .fullScreen
        }
    }
}
