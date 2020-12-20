//
//  WebViewTestViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/10/15.
//  Copyright © 2020 김재석. All rights reserved.
//
/*
 check
 1. redirectionPage 설정
 */

import UIKit
import WebKit
import Alamofire

class WebViewTestViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func touchUpToTest(_ sender: Any) {
        loadURLToWebView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }
}

extension WebViewTestViewController:WKNavigationDelegate{
    
}
//value
extension WebViewTestViewController{
    func loadURLToWebView(){
        let url = "http://ec2-3-34-156-244.ap-northeast-2.compute.amazonaws.com:8080/api/v1"
        let redirectionURL = "http://www.apple.com"
        let testUrl = URL(string: redirectionURL)
        
        let request = URLRequest(url: testUrl!)
        print("URLResquest -> \(request)")
        
        
        self.webView.load(request)
        AF.request(url).response{res in

            switch res.result{
            case .success(let value):
                let stringResult = String(data: value!, encoding: .utf8)
                self.webView.load(request)
                print("sucess -> \(type(of: value))")
                print("sucess -> \(stringResult)")
            case .failure(let error):
                print("fail -> \(error.localizedDescription)")
            }

        }
    }
}


