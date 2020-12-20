//
//  IncumbentAnswerViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/10/27.
//  Copyright © 2020 김재석. All rights reserved.
//

/*
 check
 1. cell return
 2. cell height
 
 */
import UIKit

class IncumbentAnswerViewController: UIViewController {
    
    
    @IBAction func touchUpToBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func touchUpToEvaluation(_ sender: Any) {
//        performSegue(withIdentifier: "segueForIncumbentEvaluationVC", sender: nil)
        /*
         check
         1. logic ok
         */
        print(" value Checking ----> \(sender)")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension IncumbentAnswerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionIncumbentCollectionViewCell", for: indexPath) as? QuestionIncumbentCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IncumbentAnswerCollectionViewCell", for: indexPath) as? IncumbentAnswerCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EvaluationIncumbentCollectionViewCell", for: indexPath) as? EvaluationIncumbentCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            return cell
        default:
            print("cell init")
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.width
        var defaultHeight = CGFloat(integerLiteral: 450)
        var flexibleHeight = CGFloat(integerLiteral: 30)
        
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionIncumbentCollectionViewCell", for: indexPath) as? QuestionIncumbentCollectionViewCell else{
                return CGSize(width: width, height: defaultHeight)
            }
            let topViewHeight = cell.viewToTop.bounds.height
            let contentLabelHeight = cell.labelToContent.bounds.height
            let cellHeight = topViewHeight + contentLabelHeight + flexibleHeight
            
            return CGSize(width: width, height: cellHeight)
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IncumbentAnswerCollectionViewCell", for: indexPath) as? IncumbentAnswerCollectionViewCell else{
                return CGSize(width: width, height: defaultHeight)
            }
            let topViewHeight = cell.viewToTop.bounds.height
            let contentLabelHeight = cell.labelToContent.bounds.height
            let cellHeight = topViewHeight + contentLabelHeight + flexibleHeight
        
            return CGSize(width: width, height: cellHeight)
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EvaluationIncumbentCollectionViewCell", for: indexPath) as? EvaluationIncumbentCollectionViewCell else{
                return CGSize(width: width, height: defaultHeight)
            }
            let buttonHeight = cell.buttonToEvaluation.bounds.height
            let cellHeight = buttonHeight + flexibleHeight
  
            return CGSize(width: width, height: cellHeight)
        default:
            print("cell height init")
        }
        return CGSize(width: width, height: defaultHeight)
    }
}




