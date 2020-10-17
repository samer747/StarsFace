//
//  NetworkMangers.swift
//  Stars Face
//
//  Created by samer on 10/6/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import Firebase

class NetworkManger{
    static let shared = NetworkManger()
    
    func fetchUser(uid:String , Compleated: @escaping (User) -> ()){
        
        Database.database().reference().child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dic = snapshot.value as? [String: Any] else { return }
            let user = User(uid: uid, dictionary: dic)
            Compleated(user)
        }) { (err) in
            print("Error in fetching User : ",err.localizedDescription)
        }
    }
    
    func fetchRatersCount(uid:String, Compleated: @escaping (Int) -> ()){
        Database.database().reference().child("raters").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.childrenCount
            Compleated(Int(dic))
        }) { (err) in
            print("Error in fetching User : ",err.localizedDescription)
        }
    }
}
