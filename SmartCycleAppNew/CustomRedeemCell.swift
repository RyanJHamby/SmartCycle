//
//  CustomRedeemCell.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/23/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
/*
/*class CustomRedeemCell: UITableViewCell {
    var image = UIImageView()
    let message = UILabel()
    let place = UILabel()
    let timestamp = UILabel()
    let points = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupImageView()
        setupNameLabel()
        setupPlaceLabel()
        setupTimeLabel()
        setupPointsLabel()
    }

    func setupImageView() {
        addSubview(image)
        image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10).isActive = true
        image.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -10).isActive = true
    }
    
    func setupNameLabel() {
        addSubview(message)
        message.leftAnchor.constraint(equalTo: self.image.rightAnchor, constant: 5).isActive = true
          message.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
           message.bottomAnchor.constraint(equalTo: place.topAnchor).isActive = true
           message.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    }
    
    func setupPlaceLabel() {
        addSubview(place)
        place.leftAnchor.constraint(equalTo: self.image.rightAnchor, constant: 5).isActive = true
               place.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
               place.bottomAnchor.constraint(equalTo: timestamp.topAnchor).isActive = true
               place.topAnchor.constraint(equalTo: message.bottomAnchor).isActive = true
    }
    
    func setupTimeLabel() {
        addSubview(timestamp)
        timestamp.leftAnchor.constraint(equalTo: self.image.rightAnchor, constant: 5).isActive = true
        timestamp.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        timestamp.topAnchor.constraint(equalTo: place.bottomAnchor).isActive = true
    }
    
    func setupPointsLabel() {
        points.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        points.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
}

extension CustomRedeemCell:
 */
class CustomRedeemCell: UITableViewCell {
    var message: String?
    var mainImage =  RedeemImage()
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
        let image = mainImage
        mainImageView.image = image.image

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
*/
