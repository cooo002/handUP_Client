//
//  MainSearchViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/04.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 */
import UIKit

class MainSearchViewController: UIViewController {
    
    @IBAction func touchUpBefore(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpSearch(_ sender: Any) {
        showCheckAlert(title: "확인", message: "지금은 테스트 중이여서 검색기능을 막았놨습니다. !")
        print(self.textFieldToSearch.text)

    }
    
    @IBOutlet weak var textFieldToSearch: UITextField!
    
    
    @IBAction func touchUpViewController(_ sender: Any) {
        self.textFieldToSearch.resignFirstResponder()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.modalPresentationStyle = .fullScreen
    }
    

}

extension MainSearchViewController: UITableViewDataSource, UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainSearchTableViewCell", for: indexPath) as? MainSearchTableViewCell else{
            return UITableViewCell()
        }
        cell.labelToRecentSearch.text = recentSearchResults[indexPath.row]
        return cell
    }
}

extension MainSearchViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}



class MainSearchTableViewCell:UITableViewCell{
    
    @IBOutlet weak var labelToRecentSearch: UILabel!
    
}
