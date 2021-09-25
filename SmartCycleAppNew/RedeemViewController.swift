//
//  RedeemViewController.swift
//  Vision+ML Example
//
//  Created by Ryan Hamby on 5/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth

struct CustomData {
    var image: UIImage
    var url: String
    var address1: String
    var label: String
    var rewardsArray: [rewardsData]
}

struct rewardsData {
    var rewardImage: UIImage
    var points: Int
    var rewardName: String
}

class RedeemViewController: UIViewController {

    lazy var data = [
        CustomData(image:#imageLiteral(resourceName: "Ahmo's"), url: "https://ahmos.com/", address1: "1226 Murfin Ave, Ann Arbor, MI 48109", label: "Ahmo's",rewardsArray: AhmosRewardsData ),
        CustomData(image:#imageLiteral(resourceName: "Pizza House"), url: "https://pizzahouse.com/locations/ann-arbor/", address1: "618 Church St, Ann Arbor, MI 48104", label: "Pizza House",rewardsArray: PizzaHouseRewardsData),
             CustomData(image:#imageLiteral(resourceName: "Chipotle"), url: "https://www.chipotle.com/",address1: "235 S State St, Ann Arbor, MI 48104", label: "Chipotle",rewardsArray: ChipotleRewardsData),
              CustomData(image:#imageLiteral(resourceName: "Zingerman's"), url: "https://www.youtube.com",address1: "20 Cherry Circ", label: "Zingerman's",rewardsArray: AhmosRewardsData),
              CustomData(image:#imageLiteral(resourceName: "Panda Express"), url: "https://www.youtube.com", address1: "20 Cherry Circ", label: "Panda Express",rewardsArray: AhmosRewardsData),
             CustomData(image:#imageLiteral(resourceName: "Jimmy John's"), url: "https://www.youtube.com",address1: "20 Cherry Circ", label: "Jimmy John's",rewardsArray: AhmosRewardsData),
             CustomData(image:#imageLiteral(resourceName: "Panera Bread"), url: "https://www.youtube.com",address1: "20 Cherry Circ", label: "Panera Bread",rewardsArray: AhmosRewardsData),
             CustomData(image:#imageLiteral(resourceName: "Tropical Smoothie"), url: "https://www.youtube.com",address1: "20 Cherry Circ", label: "Tropical Smoothie",rewardsArray: AhmosRewardsData),
              CustomData(image:#imageLiteral(resourceName: "Michigan Creamery"), url: "https://www.youtube.com",address1: "20 Cherry Circ", label: "Michigan Creamery",rewardsArray: AhmosRewardsData)
    ]
    
    let AhmosRewardsData = [rewardsData(rewardImage: #imageLiteral(resourceName: "glazed-carrots-final-resize-4"),points: 100, rewardName: "Free Carrots"),rewardsData(rewardImage: #imageLiteral(resourceName: "salad"),points: 200, rewardName: "Free Salad"),rewardsData(rewardImage: #imageLiteral(resourceName: "c700x420"),points: 400, rewardName: "Free Bowl"),rewardsData(rewardImage: #imageLiteral(resourceName: "how-to-make-a-fruit-smoothie-10"),points: 500, rewardName: "Free Smoothie")]
    
    let PizzaHouseRewardsData = [rewardsData(rewardImage: #imageLiteral(resourceName: "soda"),points: 50, rewardName: "Free 2L Soda"),rewardsData(rewardImage: #imageLiteral(resourceName: "pasta"),points: 250, rewardName: "Free Pasta"),rewardsData(rewardImage: #imageLiteral(resourceName: "feta"),points: 300, rewardName: "Free Feta Bread"), rewardsData(rewardImage: #imageLiteral(resourceName: "zah"),points: 400, rewardName: "Free Deep Dish Pizza")]
    
    let ChipotleRewardsData = [rewardsData(rewardImage: #imageLiteral(resourceName: "chipDrink"),points: 20, rewardName: "Free Medium Soft Drink"),rewardsData(rewardImage: #imageLiteral(resourceName: "chips"),points: 50, rewardName: "Free Chips"),rewardsData(rewardImage: #imageLiteral(resourceName: "bowl"),points: 200, rewardName: "Free Bowl"), rewardsData(rewardImage: #imageLiteral(resourceName: "burrito.jpg"),points: 400, rewardName: "Free Burrito")]

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")

        return cv
    }()

    let viewimageSegueIdentifier = "viewimageSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "Redeem"
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self
        authenticateUserAndConfigureView()
    }
    
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                        let VC = self.storyboard?.instantiateViewController(identifier: "introVC") as? IntroViewController
                        self.view.window?.rootViewController = VC
                        self.view.window?.makeKeyAndVisible()
            }
        }
            else {
                let VC = self.storyboard?.instantiateViewController(identifier: "redeemHome") as? RedeemViewController
                self.view.window?.rootViewController = VC
                self.view.window?.makeKeyAndVisible()
            }
        }
    func configureViewCompenents() {
    }
}

extension RedeemViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        return CGSize(width: collectionView.frame.width-20, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        cell.data = self.data[indexPath.row]
        return cell
    }
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(identifier: "CompanyViewController") as? CompanyViewController
    let cell = CustomCell()
    cell.data = self.data[indexPath.row]
    vc?.name = data[indexPath.row].label
    let iv = UIImageView()
        iv.image = data[indexPath.row].image
    vc?.image = iv
    vc?.url = data[indexPath.row].url
    vc?.address1 = data[indexPath.row].address1
    vc?.companyRewardsArray = data[indexPath.row].rewardsArray
    self.navigationController?.pushViewController(vc!, animated: true)
    }
}

class CustomCell: UICollectionViewCell {
    var data: CustomData? {
        didSet {
            guard let data = data else {return}
            bg.image = data.image
            name.text = data.label
            }
        }
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
       let label = UILabel(frame: CGRect(x: 20, y: 140, width:  500, height: 30))
        label.text = "test label"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .white
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(bg)
       contentView.addSubview(name)
        bg.topAnchor.constraint(equalTo:contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo:contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo:contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo:contentView.bottomAnchor).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


