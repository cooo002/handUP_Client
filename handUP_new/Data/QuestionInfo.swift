//
//  QuestionInfo.swift
//  handUP_new
//
//  Created by 김재석 on 2020/12/02.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import UIKit

struct questionInfo: Codable{
    var writerUid : String?
    var writerEmail : String?
    var title : String?
    var contents :  String?
    var profileURL : String?
    var questions : Int?
    var date : String?
    var keyword : [String]?
    
    
    var dictionaryRepresent : [String : Any]{
        return ["writerUid" : writerUid,
                "writerEmail" : writerEmail,
                 "title" : title,
                 "contents" : contents,
                 "profileURL" : profileURL,
                 "questions" : questions,
                 "date" : date,
                 "keyword" : keyword
        ]
    }
    
    init(writerUid: String?, writerEmail: String?, title: String?, contents: String?, profileURL: String?, questions: Int?, date: String?, keyword: [String]?){
        self.writerUid = writerUid
        self.writerEmail = writerEmail
        self.title = title
        self.contents = contents
        self.profileURL = profileURL
        self.questions = questions
        self.date = date
        self.keyword = keyword
        
    }
    
    init(dictionary: [String: Any]) {
        self.writerUid = dictionary["writerUid"] as? String ?? nil
        self.writerEmail = dictionary["writerEmail"] as? String ?? nil
        self.title = dictionary["title"] as? String ?? nil
        self.contents = dictionary["contents"] as? String ?? nil
        self.profileURL = dictionary["profileURL"] as? String ?? nil
        self.questions = dictionary["questions"] as? Int ?? nil
        self.date = dictionary["date"] as? String ?? nil
        self.keyword = dictionary["keyword"] as? [String] ?? nil
        
    }
    
    enum CodingKeys: String, CodingKey {
        case writerUid
        case writerEmail
        case title
        case contents
        case profileURL
        case questions
        case date
        case keyword
    }
}


////////////////////////////////////


struct userPostInfo: Codable{
    var numOfQuestion : Int?
    var numOfAnswer : Int?
    var questions : [String]?
    var answers : [String]?
    var dictionaryRepresent : [String : Any]{
        return ["numOfQuestion" : numOfQuestion,
                "numOfAnswer" : numOfAnswer,
                 "questions" : questions,
                 "answers" : answers,
        ]
    }
    
    init(numOfQuestion: Int?, numOfAnswer: Int?, questions: [String]?, answers: [String]?){
        self.numOfQuestion = numOfQuestion
        self.numOfAnswer = numOfAnswer
        self.questions = questions
        self.answers = answers
    }
    
    init(dictionary: [String: Any]) {
        self.numOfQuestion = dictionary["numOfQuestion"] as? Int ?? nil
        self.numOfAnswer = dictionary["numOfAnswer"] as? Int ?? nil
        self.questions = dictionary["questions"] as? [String] ?? nil
        self.answers = dictionary["answers"] as? [String] ?? nil
    }
    
    enum CodingKeys: String, CodingKey {
        case numOfQuestion
        case numOfAnswer
        case questions
        case answers
    }
}
