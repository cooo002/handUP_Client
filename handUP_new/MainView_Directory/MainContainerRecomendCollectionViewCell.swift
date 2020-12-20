//
//  MainContainerRecomendCollectionViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/05.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

class MainContainerRecomendCollectionViewCell: UICollectionViewCell {
    
}

extension MainContainerRecomendCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainContainerRecomendContentsCollectionViewCell", for: indexPath) as? MainContainerRecomendContentsCollectionViewCell else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0{
            return cell
        }
        else if indexPath.row == 1{
            cell.title.text = "취업고민을 함께 해결해요"
            return cell
        }
        else{
            cell.title.text = "지금 뜨는 질문을 확인하세요"
            return cell
        }
    }
}

extension MainContainerRecomendCollectionViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = CGFloat(integerLiteral: 170)
        var height = CGFloat(integerLiteral: 170)
        return CGSize(width: width, height: height)
    }
    
}


class MainContainerRecomendContentsCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var title: UILabel!
    
}
