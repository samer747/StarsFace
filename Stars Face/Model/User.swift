//
//  User.swift
//  Stars Face
//
//  Created by samer on 10/6/20.
//  Copyright © 2020 samer. All rights reserved.
//

import Foundation

struct User {
    let uid : String
    let userName : String
    let rate : Float
    let points : Int
    var numOfRaters : Int?
    let faceLink: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        userName = dictionary["UserName"] as? String ?? "Nil Name"
        rate = dictionary["rate"] as? Float ?? 0.0
        points = dictionary["points"] as? Int ?? 0
        faceLink = dictionary["faceLink"] as? String ?? "https://firebasestorage.googleapis.com/v0/b/starsface-a206e.appspot.com/o/PicsArt_10-05-11.10.18.jpg?alt=media&token=d121741f-6ffd-4ac6-aef0-78500a5f9192"
        
    }
}


struct Rater {
    let uid : String
    let userName : String
    let faceLink: String
}
