//
//  MainContainerQuestionCollectionViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/05.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
/*
 check
 1. cell 연결 o
 2. cell custom
 3.
 */
protocol MainContainerQuestionDelegate{
    func selectedCell(indexOf : Int)
}

class MainContainerQuestionCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var inerCollectinView: UICollectionView!
    func selectedCell(indexOf: Int) {
        print("delegate Test")
        self.delegate?.selectedCell(indexOf: indexOf)
    }
    
    var delegate:MainContainerQuestionDelegate?
    var recentQuestionInfosArrs : [QueryDocumentSnapshot]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("-----MainContainerQuestionCollectionViewCell call awaketFromNib------")
//        NotificationCenter.default.post(name: .newValueDidInput, object: nil, userInfo: ["data":"테스트"])
        
    }
}


extension MainContainerQuestionCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainContainerQuestionContentCollectionViewCell", for: indexPath) as? MainContainerQuestionContentCollectionViewCell else {
            return UICollectionViewCell()
        }
        let row = indexPath.row

        guard var data = self.recentQuestionInfosArrs else{
            print("data checking!!!")
            return cell
        }
        if data.count == 0 {
            cell.labelToHeadLine.text =  ""
            cell.labelToDate.text = ""
            cell.labelToContents.text = ""
            cell.labelToLocation.text = ""
        }
        else{
            cell.labelToHeadLine.text = data[row]["title"] as? String ?? ""
            cell.labelToDate.text = data[row]["date"] as? String ?? ""
            cell.labelToContents.text = data[row]["contents"] as? String ?? ""
            cell.labelToLocation.text = data[row]["questions"] as? String ?? ""
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell(indexOf: indexPath.row)
    }
}

extension MainContainerQuestionCollectionViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.width
        var height = CGFloat(integerLiteral: 120)
        return CGSize(width: width, height: height)
    }
}

extension MainContainerQuestionCollectionViewCell{
    
    //    @objc func recentQuestionInfoProcess(notification: NSNotification){
    //        guard let data = notification.userInfo["data"] else{
    //            return
    //        }
    //        self.recentQuestionInfosArr = data
    //        DispatchQueue.main.async {
    //            self.mainCollectionView.reloadData()
    //        }
    //
    //    }
    
}




//----------------------------------------------------------------------------

//MainQuestinoCellInerCell

class MainContainerQuestionContentCollectionViewCell: UICollectionViewCell {
    var performSegue : (()->())?
    @IBOutlet weak var labelToHeadLine: UILabel!
    
    @IBOutlet weak var labelToContents: UILabel!
    
    @IBOutlet weak var labelToDate: UILabel!
    
    @IBOutlet weak var labelToLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("-----MainContainerQuestionContentCollectionViewCell call awaketFromNib------")
    }
}


