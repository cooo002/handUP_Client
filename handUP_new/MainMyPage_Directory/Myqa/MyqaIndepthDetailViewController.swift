//
//  MyqaIndepthDetailViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/25.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. alert(actionSheet)
 */


import UIKit

class MyqaIndepthDetailViewController: UIViewController {
    
    @IBOutlet weak var buttonToSort: UIButton!
    
    @IBAction func touchUpToSort(_ sender: Any) {
        self.showSortActionSheet()
    }
    
    var sortActionSheet : UIAlertController?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            self.initSortActionSheet()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }


}

extension MyqaIndepthDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyqaIndepthDetailCollectionViewCell", for: indexPath) as? MyqaIndepthDetailCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.width - 4
        var height = CGFloat(integerLiteral: 180)
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueForIncumbentAnswerViewController", sender: nil)
    }
}

extension MyqaIndepthDetailViewController{
    func initSortActionSheet(){
        self.sortActionSheet = UIAlertController(title: "설정", message: "아래에서 보고싶은 것을 선택해주세요", preferredStyle: .actionSheet)
        var actionToSeletctAnswer = UIAlertAction(title: "내가 한 답변", style: .default){(UIAlertAction) in
            print(UIAlertAction)
            self.sortActionSheet?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        var actionToSeletctQuestion = UIAlertAction(title: "내가 한 질문", style: .default){(UIAlertAction) in
            print(UIAlertAction)
            self.sortActionSheet?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        var actionToSelectCancel = UIAlertAction(title: "취소", style: .destructive){_ in
            self.sortActionSheet?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        sortActionSheet?.addAction(actionToSeletctAnswer)
        sortActionSheet?.addAction(actionToSeletctQuestion)
        sortActionSheet?.addAction(actionToSelectCancel)
    }
    
    func showSortActionSheet(){
        present(self.sortActionSheet!, animated: true, completion: nil)
    }
}
