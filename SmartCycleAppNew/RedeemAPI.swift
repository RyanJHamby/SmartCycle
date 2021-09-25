//
//  RedeemAPI.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/23/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
/*
struct RedeemList: Codable {
    let redeem: [RedeemSeries]
}

var CellArr = [RedeemSeries]()
class RedeemAPI {
    static let shared = RedeemAPI()
    func fetchRedeemList() {
        let db = Firestore.firestore()
        db.collection("Users/\(Auth.auth().currentUser!.uid)/RedeemedRewards").getDocuments {(snapshot, error) in
            if error != nil {
            print("error checking current points")
            }
            else {
            for document in (snapshot?.documents)! {
            let points = document.data()["points"]
            let message = document.data()["item"]
            let place = document.data()["place"]
            let timestamp = document.data()["time"]
           let pic = document.data()["image"] as! String
            print(pic)
                let cell = RedeemSeries(image: pic, item: message as! String, place: place as! String, points: points as! Int, time: timestamp as! String)
                CellArr.insert(cell, at: 0)
          //  self.cellsArr.insert(newCell, at: 0)
            }
          }
        }
    }
}

struct RedeemSeries: Codable {
    let image: String
   let item: String
    let place: String
    let points: Int
    let time: String
}
*/
