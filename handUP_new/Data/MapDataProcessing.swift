//
//  MapDataProcessing.swift
//  handUP_new
//
//  Created by 김재석 on 2020/10/20.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import CoreLocation

/*
 check
 1. 좌표객체 만듬 -> 저장 o
 2. userDefault location에 저장된 객체를 활용하는 방법 x
 
 */
class MapDataProcessing{
    func setLocation(lat: Double, lng:Double){
        DispatchQueue.global().async {
            var locationData = location(lat:lat, lng: lng)
            var propertyListEncoder = try? PropertyListEncoder().encode(locationData)
            var userCoreData = UserDefaults.standard
            userCoreData.set(propertyListEncoder, forKey: userDefaultsKeys.location.rawValue)
            userCoreData.synchronize()
        }
    }
}
extension CLLocationManagerDelegate{
    func setLocation(completion: (()-> Void)?){

        DispatchQueue.main.async{//이전좌표 현재좌표 비교 -> 일치하지 않으면 실행
            let authStatus = CLLocationManager.authorizationStatus()
            let locationManager = CLLocationManager()
            locationManager.delegate = self//check
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            
            if authStatus == CLAuthorizationStatus.notDetermined{
                locationManager.requestWhenInUseAuthorization()
            }else{
                print(" value Checking authorizationStatus----> \(authStatus)")
                locationManager.startUpdatingLocation()
            }
            var lat =  locationManager.location?.coordinate.latitude as? Double
            var lng =  locationManager.location?.coordinate.longitude as? Double
            
            
            //이전좌표 현재좌표 비교 -> 일치하지 않으면 실행
            
            var locationData = location(lat:lat, lng: lng)
            
            var propertyListEncoder = try? PropertyListEncoder().encode(locationData)
            var userCoreData = UserDefaults.standard
            userCoreData.set(propertyListEncoder, forKey: userDefaultsKeys.location.rawValue)
            userCoreData.synchronize()
            
            if completion == nil{
                print("completion is nil")
            }
            else{
                print("completion is not nil")
                defer{
                completion!()
                } 
            }
        }
        
    }
}
