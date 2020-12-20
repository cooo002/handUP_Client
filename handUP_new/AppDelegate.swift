//
//  AppDelegate.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/01.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit
import CoreData
import NMapsMap
import CoreLocation
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window : UIWindow?
    var recentQuestionInfos = [QueryDocumentSnapshot]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        var storyboardName:String?
        var viewControllerIdentifier:String?
        var authCurrentUserInfo = Auth.auth().currentUser
        
        
        DispatchQueue.main.async {
            //Notification으로 대체할 것!!!
            //메인 data 처리
            self.setRootViewcontroller(storyboard: storyboardName!, viewController: viewControllerIdentifier!)
        }
        
        if authCurrentUserInfo != nil{
            print(" value Checking ----> \(authCurrentUserInfo?.uid)")
            print(" value Checking ----> \(authCurrentUserInfo?.email)")
            storyboardName = "Main"
            viewControllerIdentifier = "MainTabBarController"
            DispatchQueue.global().async {
                self.setNaverMap(accesskey: "ra3fwyfwi4")//accessKey MetaData
                self.initLocation()
            }
        }
        else{
            storyboardName = "Init"
            viewControllerIdentifier = "InitViewController"
            DispatchQueue.global().async {
                self.setNaverMap(accesskey: "ra3fwyfwi4")//accessKey MetaData
                self.initLocation()
            }
        }
    
        
     
        return true
    }
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "handUP_new")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

// -----------------------------------------------------------------------------------------//

extension AppDelegate{
    func setRootViewcontroller(storyboard: String, viewController: String){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // 스토리보드 인스턴스
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        // 뷰 컨트롤러 인스턴스
        let VC = storyboard.instantiateViewController(withIdentifier: viewController)
        
        // 윈도우의 루트 뷰 컨트롤러 설정
        self.window?.rootViewController = VC
        
        // 이제 화면에 보여주자.
        self.window?.makeKeyAndVisible()
    }
}


extension AppDelegate{
    func setNaverMap(accesskey : String){
        NMFAuthManager.shared().clientId = accesskey
    }
}

extension AppDelegate: CLLocationManagerDelegate{
    func initLocation(){
        setLocation(completion: nil)
    }
}


extension AppDelegate{
    // noti로 교체
}
