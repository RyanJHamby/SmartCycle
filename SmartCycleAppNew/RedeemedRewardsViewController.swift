//
//  RedeemedRewardsViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/20/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SDWebImage
import FirebaseUI


struct RedeemSeries {
    let image: UIImage
   let item: String
    let place: String
    let points: Int
    let time: String
}

var cArr = [RedeemSeries]()


class RedeemedRewardsViewController: UITableViewController {
     var cellArr = [RedeemSeries]()
    var picArray = [UIImage]()
    var safeArea: UILayoutGuide!
    var image = UIImage()
    let message = UILabel()
    let place = UILabel()
    let timestamp = UILabel()
    let points = UILabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        fetchRedeemList()
        self.tableView.reloadData()
        tableView.dataSource = self
        self.tableView.register(CustomRedeemCell.self, forCellReuseIdentifier: "customRedeem")
         tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
        func fetchRedeemList() {
            let db = Firestore.firestore()
           let storage = Storage.storage()
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
                    let cell = RedeemSeries(image: #imageLiteral(resourceName: "default_user_icon"), item: message as! String, place: place as! String, points: points as! Int, time: timestamp as! String)
                    self.cellArr.insert(cell, at: 0)
                self.tableView.reloadData()
                    }
                }
           }
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "customRedeem") as! CustomRedeemCell
        cell.mainImage = cellArr[indexPath.row].image
        cell.message = cellArr[indexPath.row].item
        cell.place = cellArr[indexPath.row].place
        cell.timestamp = cellArr[indexPath.row].time
        cell.points = cellArr[indexPath.row].points
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellArr.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


 
class CustomRedeemCell: UITableViewCell {
    var message: String?
    var mainImage: UIImage?
    var place: String?
    var points: Int?
    var timestamp: String?
    
    var messageView: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Helvetica Neue", size: 18.0)
        return textView
    }()
    
    var placeView: UILabel = {
           var textView = UILabel()
           textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Helvetica Neue", size: 13.0)
        textView.textColor = .darkGray
           return textView
       }()
    
    var timeView: UILabel = {
            var textView = UILabel()
            textView.translatesAutoresizingMaskIntoConstraints = false
         textView.font = UIFont(name: "Helvetica Neue", size: 10.0)
        textView.textColor = .lightGray
            return textView
        }()
    
    var pointsView: UILabel = {
            var textView = UILabel()
            textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Helvetica Neue", size: 18.0)
            return textView
        }()
    
    var mainImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
              imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style,  reuseIdentifier: reuseIdentifier)
        self.addSubview(mainImageView)
        self.addSubview(messageView)
        self.addSubview(placeView)
        self.addSubview(timeView)
        self.addSubview(pointsView)
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -10).isActive = true
        
     messageView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 5).isActive = true
       messageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: placeView.topAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        placeView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 5).isActive = true
        placeView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        placeView.bottomAnchor.constraint(equalTo: timeView.topAnchor).isActive = true
        placeView.topAnchor.constraint(equalTo: messageView.bottomAnchor).isActive = true
        
        timeView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 5).isActive = true
           timeView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
           timeView.topAnchor.constraint(equalTo: placeView.bottomAnchor).isActive = true
        
        pointsView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        pointsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = message {
            messageView.text = message
        }
        if let image = mainImage {
            mainImageView.image = image
        }
     /*   if let image = mainImage {
            let url = URL(string: image)
        //    let data = try? Data(contentsOf: url!)
           // imageView.image = UIImage(data: data!)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    self.mainImageView.image = UIImage(data: data!)
                }
            }
      //  mainImageView.image = UIImage(data: data!)
        } */
        if let place = place {
            placeView.text = place
        }
        if let time = timestamp {
                  timeView.text = time
              }
        if let points = points {
            let a = String(points)
            pointsView.text = "\(a) Points"
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
