//
//  UserInfoHeader.swift
//  SettingsTemplate
//
//  Created by Stephen Dowless on 2/10/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class UserInfoHeader: UIView {
    
    // MARK: - Properties
    
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        let db = Firestore.firestore()
        let userCollectionRef = db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        var hats = 4
        userCollectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    let pic = data["photo"] as? String ?? ""
                    if pic == "" {
                        iv.image = UIImage(named: "default_user_icon")
                    } else {
                    iv.sd_setImage(with: URL(string: pic), placeholderImage: nil)
                    }
                }
            }
        }
        return iv
    }()
    

    
    let pointsLabel: UILabel = {
        let label = UILabel()
        let db = Firestore.firestore()
        let userCollectionRef = db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        var hats = 4
        userCollectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    let points = data["points"] as? Int ?? 5
                    label.text = "\(points) Points"
                }
            }
        }
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        let user = Auth.auth().currentUser
        let userFirstName = user?.displayName
        let db = Firestore.firestore()
        let userCollectionRef = db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        userCollectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    let firstName = data["firstName"] as? String ?? ""
                    let lastName = data["lastName"] as? String ?? ""
                    label.text = "\(firstName) \(lastName)"
                }
            }
        }
        
       // label.text =  userFirstName
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
          let user = Auth.auth().currentUser
            let userEmail = user?.email
            label.text = userEmail
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let profileImageDimension: CGFloat = 60
        
        addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImageView.layer.cornerRadius = profileImageDimension / 2
        
        addSubview(usernameLabel)
        usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -10).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        
        addSubview(emailLabel)
        emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 10).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        
        addSubview(pointsLabel)
        pointsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
