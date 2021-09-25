//
//  CompanyViewController.swift
//  Vision+ML Example
//
//  Created by Ryan Hamby on 5/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth
import FirebaseStorage

var pointsVal = 0


class CompanyViewController: UIViewController {
    
    var imageName: UILabel!
    @IBOutlet weak var label: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var address: UILabel!
    //@IBOutlet weak var rPoints: UILabel!
    var name = ""
    var pointsCon = ""
    var url = ""
    var RedeemCellHeight = CGFloat(0)
    var companyRewardsArray: [rewardsData]!
    var address1 = "Xcv"
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CompanyCustomCell.self, forCellWithReuseIdentifier: "cell")

        return cv
    }()

    var pointsArr = [pointsVal]
    
    override func viewDidLoad() {
        print(name)
        
      let attributedString = NSMutableAttributedString(string: "Website")
        let urlLink = URL(string: url)!
        // Set the 'click here' substring to be the link
        attributedString.setAttributes([.link: urlLink], range: NSMakeRange(0, 7))
        label.attributedText = attributedString
        label.isUserInteractionEnabled = true
        label.isEditable = false
        label.textContainerInset = UIEdgeInsets.zero;
        label.textContainer.lineFragmentPadding = 0;
        address.text = address1
       // rPoints.text = companyRewardsArray[0].rewardName
//        image.image = UIImage(named: name)
//address.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        navigationItem.title = name
        super.viewDidLoad()
          view.addSubview(collectionView)
        RedeemCellHeight = collectionView.collectionViewLayout.collectionViewContentSize.height

          collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
          collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
        checkCurrentPoints()
        collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
    @objc func tap(sender: UITapGestureRecognizer){

    if let indexPath = self.collectionView.indexPathForItem(at: sender.location(in: self.collectionView)) {
      //  let cell = self.collectionView.cellForItem(at: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CompanyCustomCell
        cell.data = self.companyRewardsArray[indexPath.row]
 
        if (pointsArr.first! < cell.data!.points) {
            let alert = UIAlertController(title: "Not enough points", message: "", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                       self.present(alert, animated: true)
            checkCurrentPoints()
            return
        }
        
        let alert = UIAlertController(title: "Redeem \"\(cell.data?.rewardName ?? "")\" reward?", message: "If yes, present phone to cashier. This action cannot be undone.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let exactDate = self.realDate()
            let userId = Auth.auth().currentUser!.uid
            
            //Create a reference to the image
            let imageRef = Storage.storage().reference().child("image.jpg")

            // Get image data
            if let uploadData = UIImagePNGRepresentation(cell.data!.rewardImage) {

                // Upload image to Firebase Cloud Storage
                imageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                    guard error == nil else {
                        // Handle error
                        return
                    }
                    // Get full image url
                    imageRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                            // Handle error
                            return
                        }

                        // Save url to database
                        Firestore.firestore().collection("Users/\(userId)/RedeemedRewards").document("\(exactDate)").setData(["time": exactDate, "place": self.name, "item": cell.data!.rewardName, "points": cell.data!.points, "image" : url!.absoluteString])
                    }
                }
            }
            
          //  self.db.collection("Users/\(userId)/RedeemedRewards").document("\(exactDate)").setData(["time": exactDate, "place": self.name, "item": cell.data!.rewardName, "points": cell.data!.points, "image": cell.data!.rewardImage])
             let alert = UIAlertController(title: "\"\(cell.data?.rewardName ?? "")\" reward redeemed at \(exactDate) ", message: "If not done already, present phone screen to cashier now.", preferredStyle: .alert)
            self.subtractPoints(var: cell.data!.points)
                   alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                       self.present(alert, animated: true)
        }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        } else {
            print("collection view was tapped")
        }
    }
    
    private func getDocument() {
        //Get sspecific document from current user
        let docRef = Firestore.firestore().collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")

        // Get data
        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            } else if querySnapshot!.documents.count != 1 {
                print("More than one documents or none")
            } else {
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                guard let firstname = dataDescription?["firstname"] else { return }
                print(firstname)
            }
        }
    }
    
    var  db = Firestore.firestore()
    func checkCurrentPoints() {
        let userId = Auth.auth().currentUser?.uid
        db.collection("Users").whereField("uid", isEqualTo: userId as Any).getDocuments {(snapshot, error) in
            if error != nil {
            print("error checking current points")
            }
            else {
            for document in (snapshot?.documents)! {
            if let points = document.data()["points"] as? Int {
                print(points)
                self.pointsArr.insert(points, at: 0)
                let ref = self.db.collection("Users").document(Auth.auth().currentUser!.uid)
                ref.updateData(["points": points])
                self.collectionView.reloadData()
            }
            }
            }
        }
    }
    
    func subtractPoints(`var` p: Int) {
        let userCollectionRef = db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        let pointsValue = p
           var points = 0
             userCollectionRef.getDocuments { (snapshot, error) in
               if let err = error {
                   debugPrint("Error fetching docs: \(err)")
               } else {
                   guard let snap = snapshot else {return}
                   for document in snap.documents {
                       let data = document.data()
                       points = data["points"] as? Int ?? 5
                       points = points - pointsValue
                       let ref = self.db.collection("Users").document(Auth.auth().currentUser!.uid)
                       ref.updateData(["points": points])
                    self.pointsArr.insert(points, at: 0)
                   }
               }
           }
    }
    
    func realDate() -> String {
        let now = Date()

           let formatter = DateFormatter()

           formatter.timeZone = TimeZone.current

           formatter.dateFormat = "MM-dd-yyyy h:mm:ss a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"

           let dateString = formatter.string(from: now)
        return dateString
        }
    


    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension CompanyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
    return CGSize(width: collectionView.frame.width-20, height: collectionView.frame.width/2)
}
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
    return companyRewardsArray.count
}
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CompanyCustomCell
    cell.backgroundColor = .white
    cell.data = self.companyRewardsArray[indexPath.row]
    return cell
}
}

class CompanyCustomCell: UICollectionViewCell {
       var data: rewardsData? {
           didSet {
               guard let data = data else {return}
               bg.image = data.rewardImage
               name.text = data.rewardName
            namePoints.text = String(data.points)
               bg.addSubview(fg)
               }
           }
       fileprivate let fg: UIImageView = {
           let im = UIImageView()
                 im.backgroundColor = .systemGreen
          
           im.frame = CGRect(x: 0, y: 0, width: 100000,height: 40)
           return im
       }()
   let frameHeight = 0
       fileprivate let bg: UIImageView = {
           let iv = UIImageView()
           iv.image = #imageLiteral(resourceName: "Ahmo's")
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.contentMode = .scaleAspectFill
           iv.clipsToBounds = true
           iv.layer.cornerRadius = 12
           return iv
       }()
       let name: UILabel = {
          let label = UILabel(frame: CGRect(x: 20, y: 7, width:  500, height: 30))
           label.text = "test label"
           label.textAlignment = .left
           label.font = UIFont.boldSystemFont(ofSize: 20.0)
           label.textColor = .white
           return label
       }()
    let namePoints: UILabel = {
       let label = UILabel(frame: CGRect(x: 300, y: 7, width:  500, height: 30))
        label.text = "test lassds"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .white
        return label
    }()
       override init(frame: CGRect) {
           super.init(frame:frame)
           contentView.addSubview(bg)
          contentView.addSubview(name)
        contentView.addSubview(namePoints)
           bg.topAnchor.constraint(equalTo:contentView.topAnchor).isActive = true
           bg.leadingAnchor.constraint(equalTo:contentView.leadingAnchor).isActive = true
           bg.trailingAnchor.constraint(equalTo:contentView.trailingAnchor).isActive = true
           bg.bottomAnchor.constraint(equalTo:contentView.bottomAnchor).isActive = true
           
       }
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   }


