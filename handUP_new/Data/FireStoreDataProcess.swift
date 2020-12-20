//
//  FireStoreDataProcess.swift
//  handUP_new
//
//  Created by 김재석 on 2020/12/16.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

extension UIViewController{
    
    func setUserInfo(uid : String?, email: String?, name: String?, gender: String?, classfication: Int?, score: Int?, location: String?, anonymity: Bool?){ //
        DispatchQueue.global().async {
            let classes = returnClass(classfication: classfication, score: score)
            
            let user = userInfo(uid: uid, email: email, name: name, gender: gender, score: score, classfication: classfication, classes: classes, location: location, Anonymity: anonymity)
            self.sendUserInfoToFireStore(data: user)
            
            var propertyListEncoder = try? PropertyListEncoder().encode(user)
            var userCoreData = UserDefaults.standard
            userCoreData.set(propertyListEncoder, forKey: userDefaultsKeys.userInfo.rawValue)
            userCoreData.synchronize()
        }
    }
    
    func setUserPostInfo(numOfQuestion:Int?, numOfAnswer:Int?, questions:[String]?, answers : [String]?){
        let userPost = userPostInfo(numOfQuestion: numOfQuestion, numOfAnswer: numOfAnswer, questions: questions, answers: answers)
        self.sendQuestionIDFireStoreForInit(userPostInfo: userPost)
        var propertyListEncoder = try? PropertyListEncoder().encode(userPost)
        var userCoreData = UserDefaults.standard
        userCoreData.set(propertyListEncoder, forKey: userDefaultsKeys.userPostInfo.rawValue)
        userCoreData.synchronize()
    }
    
    func loadUerInfo() -> userInfo {
        // 로그인한 유저 정보 불러오는 작업 수행
        // userDefault에 저장된 데이터 뽑아오는 로직 작성
        if UserDefaults.standard.object(forKey: userDefaultsKeys.userInfo.rawValue) != nil{
            let returnUserInfo : userInfo?
            if let data = UserDefaults.standard.value(forKey: userDefaultsKeys.userInfo.rawValue) as? Data{
                let decoderUserInfo = try? PropertyListDecoder().decode(userInfo.self, from: data)
                print(decoderUserInfo)
                return decoderUserInfo!
            }
        }
        return userInfo(uid: "no", email: "no", name: "no", gender: "no", score: 0, classfication: 0, classes: "no", location: "no", Anonymity: false)
    }
    
    func loadUerPostInfo() -> userPostInfo{
        // 로그인한 유저가 작성한 질문, 답변 불러오는 작업 수행!
        // userDefault에 저장된 데이터 뽑아오는 로직 작성
        if UserDefaults.standard.object(forKey: userDefaultsKeys.userPostInfo.rawValue) != nil{
            let returnUserInfo : userInfo?
            if let data = UserDefaults.standard.value(forKey: userDefaultsKeys.userPostInfo.rawValue) as? Data{
                let decoderUserInfo = try? PropertyListDecoder().decode(userPostInfo.self, from: data)
                print(decoderUserInfo)
                return decoderUserInfo!
            }
        }
        return userPostInfo(numOfQuestion: 0, numOfAnswer: 0, questions: nil, answers: nil)
    }
    
    func receivedUserInfoFromFireStore(){
        // fireStore에서 userInfo 받아오는 로직 수행
        var db = Firestore.firestore()
        var uid = Auth.auth().currentUser?.uid
        // 1. recievedData from FirsStore
        let docRef = db.collection("users").document(uid!)
        
        DispatchQueue.global().async {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    defer{
                        let user = userInfo(dictionary: data!)
                        var propertyListEncoder = try? PropertyListEncoder().encode(user)
                        var userCoreData = UserDefaults.standard
                        userCoreData.set(propertyListEncoder, forKey: userDefaultsKeys.userInfo.rawValue)
                        userCoreData.synchronize()
                    }
                    print("Document data: \(data)")
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    func sendUserInfoToFireStore(data: userInfo){
        // fireStore에 userInfo를 보내는 로직 수행
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        
        let data = data.dictionaryRepresent
        
        do {
            try db.collection("users").document(uid!).setData(data)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func sendQuestionInfoToFireStore(title: String?, contents: String?, keywords: [String]?){
        // fireStore에 작성한 QuestionInfo를 보내는 로직 수행
        // 1. 회원 가입할 때 uid를 이용해서 userQuestions에 만들어둠 -> 질문함 -> sendQuestionInfoToFireStore를 통해 qustions에 데이터 쓰기 -> userQuestions에 새로만든 질문의 uid 업데이트
        // 2. qustionRelation Cellection 만들어두기 x
        
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        let email = Auth.auth().currentUser?.email
        let keywordArr = keywords
        let nowDate = returnStringOfNow()
        let data = questionInfo(writerUid: uid, writerEmail: email, title: title, contents: contents, profileURL: nil, questions: 2, date: nowDate, keyword: keywordArr).dictionaryRepresent
        
        var ref: DocumentReference? = nil
        
        ref = db.collection("questions").addDocument(data: data){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                //                 -여기 qustionRelation Cellection 만드는 메소드 들어갈거!-
                
                self.sendQuestionIDFireStoreForUpdate(questionID: ref!.documentID)
            }
        }
    }
    
    func sendQuestionIDFireStoreForUpdate(questionID: String){
        // fireStore에 userQuestions에 질문Uid 업데이트, 질문 수 업데이트
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        do{
            try db.collection("usersQuestions").document(uid!).updateData([
                "questions": FieldValue.arrayUnion([questionID])
            ])
        }
        catch let error{
            print("Error writing city to Firestore: \(error)")
        }
        
        do{
            try db.collection("usersQuestions").document(uid!).updateData([
                "numOfQuestion": FieldValue.increment(Int64(1))
            ])
        }
        catch let error{
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    
    func sendQuestionIDFireStoreForInit(userPostInfo: userPostInfo){
        //fireStore에 userPostInfo 쓰기 및 업데이트
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        // read해서 없으면 새로쓰기 있으면 업데이트
        let data = userPostInfo.dictionaryRepresent
        do{
            try db.collection("usersQuestions").document(uid!).setData(data)
        }
        catch let error{
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func sendAnserUIDFireStoreForUpdate(answerID: String){
        // 1. fireStore에 userQuestions에 답변Uid 업데이트, 답변 수 업데이트, 답변완료할 때 실행!
        // 2. 코드변경 완료
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        do{
            try db.collection("usersQuestions").document(uid!).updateData([
                "answers": FieldValue.arrayUnion([answerID])
            ])
        }
        catch let error{
            print("Error writing city to Firestore: \(error)")
        }
        
        do{
            try db.collection("usersQuestions").document(uid!).updateData([
                "numOfAnswer": FieldValue.increment(Int64(1))
            ])
        }
        catch let error{
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func sendAnswerInfoToQuestionRalationCollection(questionUid: String?, contents: String?){
        // 1. 특정 질문에 답변을 달면 메소드가 실행되면서 QuestionRelationCollection에 AnswerInfo가 쓰여짐
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        let email = Auth.auth().currentUser?.email
        let nowDate = returnStringOfNow()
        let data = answerInfo(writerUid: uid, writerEmail: email, title: nil, contents: contents, profileURL: nil, questions: nil, date: nowDate)
        var ref: DocumentReference? = nil
        ref = db.collection("questionRelation").document(questionUid!).collection("answer").addDocument(data: data.dictionaryRepresent){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                self.sendAnserUIDFireStoreForUpdate(answerID: ref!.documentID)
            }
        }
    }
    
    
}




