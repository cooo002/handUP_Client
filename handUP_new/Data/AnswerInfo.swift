//
//  AnswerInfo.swift
//  handUP_new
//
//  Created by 김재석 on 2020/12/15.
//  Copyright © 2020 김재석. All rights reserved.
//

import Foundation
import UIKit

struct answerInfo: Codable{
    var writerUid : String?
    var writerEmail : String?
    var title : String?
    var contents :  String?
    var profileURL : String?
    var questions : Int?
    var date : String?
    var dictionaryRepresent : [String : Any]{
        return ["writerUid" : writerUid,
                "writerEmail" : writerEmail,
                 "title" : title,
                 "contents" : contents,
                 "profileURL" : profileURL,
                 "questions" : questions,
                 "date" : date
        ]
    }
    
    init(writerUid: String?, writerEmail: String?, title: String?, contents: String?, profileURL: String?, questions: Int?, date: String?){
        self.writerUid = writerUid
        self.writerEmail = writerEmail
        self.title = title
        self.contents = contents
        self.profileURL = profileURL
        self.questions = questions
        self.date = date
    }
    
    init(dictionary: [String: Any]) {
        self.writerUid = dictionary["writerUid"] as? String ?? nil
        self.writerEmail = dictionary["writerEmail"] as? String ?? nil
        self.title = dictionary["title"] as? String ?? nil
        self.contents = dictionary["contents"] as? String ?? nil
        self.profileURL = dictionary["profileURL"] as? String ?? nil
        self.questions = dictionary["questions"] as? Int ?? nil
        self.date = dictionary["date"] as? String ?? nil
    }
    
    enum CodingKeys: String, CodingKey {
        case writerUid
        case writerEmail
        case title
        case contents
        case profileURL
        case questions
        case date
    }
}

