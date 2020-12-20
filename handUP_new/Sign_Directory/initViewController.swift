//
//  initViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/01.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class initViewController: UIViewController {

    
    @IBAction func unwindForInitViewController (segue : UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForSign" {
            let destination = segue.destination as? SignUPInitNavigationViewController
            destination?.modalPresentationStyle = . fullScreen
        }
        else if segue.identifier == "segueForLogIn"{
            let destination = segue.destination as? LogInNavigationViewController
            destination?.modalPresentationStyle = . fullScreen
        }
    }
}


class InitNavigationViewController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
    }
}

