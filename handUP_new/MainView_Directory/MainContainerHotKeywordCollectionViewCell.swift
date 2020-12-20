//
//  MainContainerHotKeywordCollectionViewCell.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/05.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

/*
check
1. cell 연결 o
2. cell custom
3.
*/
class MainContainerHotKeywordCollectionViewCell: UICollectionViewCell {
    
}
//1. table Cell
extension MainContainerHotKeywordCollectionViewCell:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotKeyWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "MainContainerHotKeywordContentTableViewCell", for: indexPath) as? MainContainerHotKeywordContentTableViewCell else {
            return UITableViewCell()
        }
        cell.labelToRankingHeadLine.text = hotKeyWords[indexPath.row]
        return cell
    }
    
    
}


class MainContainerHotKeywordContentTableViewCell: UITableViewCell {
    @IBOutlet weak var labelToRanking: UILabel!
    
    @IBOutlet weak var labelToRankingHeadLine: UILabel!
    
    @IBOutlet weak var labelToNumOfRanking: UILabel!
    
}
