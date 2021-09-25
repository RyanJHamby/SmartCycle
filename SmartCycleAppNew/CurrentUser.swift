//
//  CurrentUser.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/14/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import Foundation

struct CurrentUser {
    let uid: String
    let name: String
    let email: String
    
    init(uid: String, dictionary: [String:Any]) {
        self.uid = uid
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
