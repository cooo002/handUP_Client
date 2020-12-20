//
//  MainAnswerTabBarViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/08.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit
/*
 check
 1. custom Top TabBar(collectionView Horizontal)
 2. cotainerView
 3. search o
 4. customTabBarAntion
 
 */

class MainAnswerTabBarViewController: UIViewController {
    
    
    
    @IBAction func touchUpToMenuButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForSearch"{
            let destination = segue.destination
            destination.modalPresentationStyle = .fullScreen
        }
        
    }
    
    
}
