//
//  ProfileViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/15.
//  Copyright © 2020 김재석. All rights reserved.
/*
 check
 1. containerView ProfileBasicViewcontroller o
 2. ouletm, action o
 3. containerView ProfileBasicViewController constraints(center o) o
 - constraints가 걸릴 view으 크기가 안 주어져서 생긴 문제
 4. 처음 시작할 때 customTabBar는 첫번째 셀이 선택되어 있어야함
 ㄱ. profile init -> profileBasic, 0 indexPath Selected
 
 */

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func touchUpToBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpToMenu(_ sender: Any) {
    }
    
    @IBOutlet weak var containerViewToVC: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setContainerViewController(storyboard: "ProfileBasic", viewControllerID: "ProfileBasicViewController")
    }
}

extension ProfileViewController:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileTopTabBarCellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileTopCustomCollectionViewCell", for: indexPath) as? ProfileTopCustomCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: false , scrollPosition: .init())
            cell.isSelected = true
            
        }
        cell.labelToName.text = profileTopTabBarCellNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var cell = collectionView.cellForItem(at: indexPath) as? ProfileTopCustomCollectionViewCell else{
            fatalError()
        }
        
        cell.labelToName.textColor = .black
        cell.viewToBottom.backgroundColor = hexStringToUIColor(hex: "#30BDDC")
        
        actionToSelectedCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard var cell = collectionView.cellForItem(at: indexPath) as? ProfileTopCustomCollectionViewCell else{
            fatalError()
        }
        cell.labelToName.textColor = .lightGray
        cell.viewToBottom.backgroundColor = hexStringToUIColor(hex: "#D3F1F8")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = returnCellSize(width: (collectionView.bounds.width/4) , height: 40)
        return size
    }
}

extension ProfileViewController{
    func setContainerViewController(storyboard: String, viewControllerID: String){
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        self.addChild(VC)
        containerViewToVC.addSubview((VC.view)!)
        VC.view.frame = containerViewToVC.bounds
        VC.didMove(toParent: self)
    }
    
    func actionToSelectedCell(indexPath : IndexPath){
        switch indexPath.row {
        case 0:
            setContainerViewController(storyboard: "ProfileBasic", viewControllerID: "ProfileBasicViewController")
        case 1:
            setContainerViewController(storyboard: "ProfileClass", viewControllerID: "ProfileClassViewController")
        case 2:
            setContainerViewController(storyboard: "ProfileField", viewControllerID: "ProfileFieldViewController")
        case 3:
            setContainerViewController(storyboard: "ProfileKeyword", viewControllerID: "ProfileKeywordViewController")
        default:
            print("-touchUP\(indexPath.row)-")
        }
    }
}
