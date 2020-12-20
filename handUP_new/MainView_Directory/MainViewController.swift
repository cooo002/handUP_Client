//
//  ViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/01.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. navigationBar isHidden
 */

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func unwindForMainViewController (segue : UIStoryboardSegue) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let bar = UIApplication.statusBarView else {
            return
        }
//        UIApplication.statusBarTintColor = .black
//        bar.tintColor = .black
//        bar.backgroundColor = .black
// Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segueForSearch"{
            let destination = segue.destination
            destination.modalPresentationStyle = .fullScreen
        }
    }


}

class MainTabBarController: UITabBarController {

    @IBAction func unwindForMainTabBarController(segue : UIStoryboardSegue){
        
    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .darkContent
//    }

//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigtionBarIsHidden(VC: self, bool: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigtionBarIsHidden(VC: self, bool: true)
    }


}
