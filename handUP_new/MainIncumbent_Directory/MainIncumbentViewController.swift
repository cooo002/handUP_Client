//
//  MainIncumbentViewController.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/04.
//  Copyright © 2020 김재석. All rights reserved.
//

import UIKit
import Alamofire
import NMapsMap
import CoreLocation


/*
 check
 1. background Color x
 2. cell o
 3. map(현재 좌표 설정), Cllocation 허용권한 체크 o
 4. keyword View Dynamic
 5. cllocatinoMethod custom o
 */


class MainIncumbentViewController: UIViewController {
    
    
    @IBOutlet weak var viewToNaverMap: NMFMapView!
    var currentLocation:CLLocation?
    var locationManager : CLLocationManager!
    var lat : Double?
    var lng : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshLocationData()
        showCheckAlert(title: "확인", message: "지금 주변에 현직자가 없어요 !")
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
extension MainIncumbentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainIncumbentCollectionViewCell", for: indexPath) as? MainIncumbentCollectionViewCell else{
            return UICollectionViewCell()
        }
        let user = loadUerInfo()
        cell.labelToID.text = user.email
        cell.labelToClass.text = user.classes
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = CGFloat(integerLiteral: 135)
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 메소드 하나 만들어서 빼기
        self.performSegue(withIdentifier: "segueForIncumbentDetail", sender: nil)
//        let storyboardName = "IncumbentDetail"
//        let vcIdentifier = "IncumbentDetailViewController"
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        let VC = storyboard.instantiateViewController(withIdentifier: vcIdentifier)
//        VC.modalPresentationStyle = .fullScreen
//        present(VC, animated: true, completion: nil )
    }
}

extension MainIncumbentViewController: CLLocationManagerDelegate{
    func refreshLocationData(){
        setLocation(){
            let locationObjc = UserDefaults.standard.value(forKey: userDefaultsKeys.location.rawValue) as? Data
            let decoderUserInfo = try? PropertyListDecoder().decode(location.self, from: locationObjc!)
            self.lat = decoderUserInfo?.lat
            self.lng = decoderUserInfo?.lng
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: self.lat!, lng: self.lng!))
            self.viewToNaverMap.moveCamera(cameraUpdate)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        currentLocation = locations[locations.count-1] as! CLLocation
        print("locations = \(currentLocation)")
    }
}

extension MainIncumbentViewController{
    func showCheckAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
