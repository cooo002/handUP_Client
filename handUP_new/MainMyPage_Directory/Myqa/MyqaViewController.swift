//
//  MyQ&AViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/21.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. actionToSelectedCell 수정
 2. myqa containerView
 3. containerView inner cell = detailCollectionViewCell
 4. logic_back: 1 tab selected!!!
 */
import UIKit

class MyqaViewController: UIViewController {

    @IBAction func touchUpToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpToMenu(_ sender: Any) {
    }
    
    
    @IBOutlet weak var containerViewToVC: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setContainerViewController(storyboard: "MyqaDetail", viewControllerID: "MyqaDetailViewController")
        setContainerViewController(storyboard: "IncuriousQuestionAlert", viewControllerID: "IncuriousQuestionAlertViewController")
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

extension MyqaViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myqaTopTabBarCellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyaqTopCustomTabBarCollectionViewCell", for: indexPath) as? MyaqTopCustomTabBarCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: false , scrollPosition: .init())
            cell.isSelected = true
            
        }
        cell.labelToName.text = myqaTopTabBarCellNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var cell = collectionView.cellForItem(at: indexPath) as? MyaqTopCustomTabBarCollectionViewCell else{
            fatalError()
        }
        
        
        cell.labelToName.textColor = .black
        cell.viewToBottom.backgroundColor = hexStringToUIColor(hex: "#30BDDC")
        
        actionToSelectedCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard var cell = collectionView.cellForItem(at: indexPath) as? MyaqTopCustomTabBarCollectionViewCell else{
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

extension MyqaViewController{
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
            setContainerViewController(storyboard: "IncuriousQuestionAlert", viewControllerID: "IncuriousQuestionAlertViewController")
        case 1:
            setContainerViewController(storyboard: "IncuriousQuestionAlert", viewControllerID: "IncuriousQuestionAlertViewController")
//            setContainerViewController(storyboard: "MyqaDetail", viewControllerID: "MyqaDetailViewController")
        case 2:
            setContainerViewController(storyboard: "IncuriousQuestionAlert", viewControllerID: "IncuriousQuestionAlertViewController")
//            setContainerViewController(storyboard: "MyqaDetail", viewControllerID: "MyqaDetailViewController")
        case 3:
            setContainerViewController(storyboard: "IncuriousQuestionAlert", viewControllerID: "IncuriousQuestionAlertViewController")
//            setContainerViewController(storyboard: "MyqaIndepthDetail", viewControllerID: "MyqaIndepthDetailViewController")
        default:
            print("-touchUP\(indexPath.row)-")
        }
    }
}

