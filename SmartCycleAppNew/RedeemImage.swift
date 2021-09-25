//
//  RedeemImage.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/23/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit

class RedeemImage: UIImageView {
    
    func loadImage(from url: URL) {
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard
        let data = data,
            let newImage = UIImage(data: data)
            else {
                print("couldn't load image from url \(url)")
                return
        }
        
        DispatchQueue.main.async {
            self.image = newImage
        }
    }
    task.resume()
    }
}
