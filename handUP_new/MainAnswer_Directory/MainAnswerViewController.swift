//
//  MainAnswerViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/04.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit

/*
 check
 1. custom Top TabBar(collectionView Horizontal)
 2. cotainerView
 3. search o
 4. customTabBarAntion
 5. customTabBar cell height
 6. cell select color(lgiht gray, D3F1F8)
 7. settingView
 8. contentsViewTableView
 9. kyword Action
 10. sorting Action
 11. table cell spacing
 
 */
class MainAnswerViewController: UIViewController {
    
    
    @IBOutlet weak var tableViewToContents: UITableView!
    
    @IBOutlet weak var buttonToNumOfAnswer: UIButton!
    
    @IBOutlet weak var buttonToRecent: UIButton!
    
    @IBAction func touchUpToFilterButton(_ sender: Any) {
        
    }
    
    @IBAction func touchUpToFilterSetting(_ sender: Any) {
    }
    
    @IBAction func touchUpToNumOfAnswer(_ sender: Any) {
        setButtonSelected(selected: buttonToNumOfAnswer, deselected: buttonToRecent)
    }
    
    @IBAction func touchUpToRecent(_ sender: Any) {
        setButtonSelected(selected: buttonToRecent, deselected: buttonToNumOfAnswer)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonSelected(selected: buttonToNumOfAnswer, deselected: buttonToRecent)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showCheckAlert(title: "확인", message: "지금은 데이터가 없습니다ㅠㅠ")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "segueForQuestionDetail"{
                  
    //              let destinationData = completeTitle(head: "질문하기 완료!", contents: "질문하기가 완료되었습다 ! 좀 더 자세한 질문을 하고싶다면 아래 1대1 질문하기 기능을 이용해 보세요 :)", topButtom: "1대1 질문하기", buttomButton: "메인화면으로 돌아가기")
                  var destination = segue.destination
                  destination.modalPresentationStyle = .fullScreen
    //              destination?.uiTitles = destinationData
              }
          }
    
}

extension MainAnswerViewController{
    func setButtonSelected(selected: UIButton, deselected:UIButton){
        selected.isSelected = true
        deselected.isSelected = false
    }
}

// -------------------------TopCutomTabBar(CollectionView)-------------------
extension MainAnswerViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainAnswerTabBarCellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainAnswerCustomTabBarCollectionViewCell", for: indexPath) as? MainAnswerCustomTabBarCollectionViewCell else{
            return UICollectionViewCell()
        }
    
        cell.labelToName.text = mainAnswerTabBarCellNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var cell = collectionView.cellForItem(at: indexPath) as? MainAnswerCustomTabBarCollectionViewCell else{
            fatalError()
        }
        cell.labelToName.textColor = .black
        cell.viewToBottom.backgroundColor = hexStringToUIColor(hex: "#30BDDC")
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard var cell = collectionView.cellForItem(at: indexPath) as? MainAnswerCustomTabBarCollectionViewCell else{
            fatalError()
        }
        cell.labelToName.textColor = .lightGray
        cell.viewToBottom.backgroundColor = hexStringToUIColor(hex: "#D3F1F8")
    }
}

extension MainAnswerViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = returnCellSize(width: (collectionView.bounds.width/4) , height: 40)
        return size
    }
}

// -------------------------ContentsTableView(tableView)-------------------
extension MainAnswerViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainAnswerContentTableViewCell", for: indexPath) as? MainAnswerContentTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat(integerLiteral: 177)
        return height
    }
    
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
