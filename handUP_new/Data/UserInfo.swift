//
//  UserInfo.swift
//  handUP_new
//
//  Created by 김재석 on 2020/09/25.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import UIKit

var recentSearchResults = ["ios", "개발자", "컴퓨터", "디자인", "협업 툴", "코딩테스트", "스타트업"]

let hotKeyWords = ["스포츠", "프로그래밍", "코로나", "컴퓨터", "음식"]

let mainAnswerTabBarCellNames = ["전체", "관심분야", "관심지역", "관심키워드"]

let profileTopTabBarCellNames = ["기본정보", "계급", "활동분야", "관심키워드"]

let settingContents = ["프로필 설정", "나의 크레딧", "나의 Q&A", "설정", "로그아웃"]

let profileBasicTableViewSetTitles = ["이름", "성별", "계급", "거주지역", "익명활동"]

let myqaTopTabBarCellNames = ["궁금한 질문", "나의 질문", "나의 답변", "1대1 질문"]



let settingContentsDic = ["프로필 설정":UIImage(named: "user"),
                          "나의 크레딧":UIImage(named: "credit"),
                          "나의 Q&A":UIImage(named: "q&a"),
                          "설정": UIImage(named: "setting"),
                          "로그아웃":UIImage(named: "logOut")]

func returnClass(classfication : Int?, score: Int?) -> String{
    if classfication == 0{
        switch score! {
        case 0..<101:
            return "일반학생"
        case 101..<201:
            return "우등생"
        case 201..<301:
            return "전교1등"
        default:
            return ""
        }
    }
    else{
        switch score! {
        case 0..<101:
            return "교생선생님"
        case 101..<201:
            return "담임선생님"
        case 201..<301:
            return "교장선생님"
        default:
            return ""
        }
    }
}

enum userDefaultsKeys : String {
    case profileImage
    case userInfo
    case location
    case userPostInfo
}

struct userInfo: Codable{
    var uid : String?
    var email : String?
    var name :  String?
    var gender : String?
    var score : Int?
    var classfication : Int?
    var classes : String?
    var location: String?
    var Anonymity : Bool?
    var dictionaryRepresent : [String : Any]{
        return [ "uid" : uid,
                 "email" : email,
                 "name" : name,
                 "gender" : gender,
                 "score" : score,
                 "classfication" : classfication,
                 "classes" : classes,
                 "location" : location,
                 "Anonymity" : Anonymity
        ]
    }
    
    init(uid: String?, email: String?, name: String?, gender: String?, score: Int?, classfication: Int?, classes: String?, location: String?, Anonymity: Bool?){
        self.uid = uid
        self.email = email
        self.name = name
        self.gender = gender
        self.score = score
        self.location = location
        self.classfication = classfication
        self.classes = classes
        self.Anonymity = Anonymity
    }
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? nil
        self.email = dictionary["email"] as? String ?? nil
        self.name = dictionary["name"] as? String ?? nil
        self.gender = dictionary["gender"] as? String ?? nil
        self.score = dictionary["score"] as? Int ?? nil
        self.location = dictionary["location"] as? String ?? nil
        self.classfication = dictionary["classfication"] as? Int ?? nil
        self.classes = dictionary["classes"] as? String ?? nil
        self.Anonymity = dictionary["Anonymity"] as? Bool ?? nil
    }
    
    enum CodingKeys: String, CodingKey {
        case uid
        case email
        case name
        case gender
        case score
        case classfication
        case classes
        case location
        case Anonymity
    }
}

struct location: Codable{
    var lat : Double!
    var lng : Double!
}


struct completeTitle {
    init(head: String, contents: String, topButtom: String, buttomButton: String){
        headLineTitle = head
        contentsTitle = contents
        topButtonTitle = topButtom
        bottomButtonTitle = buttomButton
    }
    var headLineTitle : String?
    var contentsTitle : String?
    var topButtonTitle : String?
    var bottomButtonTitle : String?
}


struct postRead:Codable{
    var id : Int
    var title : String
    var author : String
    var modifiedDate : String
}

struct postWritten:Codable {
    //    init(Author : String, Content : String, Title: String){
    //        author = Author
    //        content = Content
    //        title = Title
    //    }
    
    var author : String
    var content : String
    var title : String
    
    //    var postJson = {
    //        let encoder = JSONEncoder()
    //        return encoder.encode(Self)
    //    }
    
}
