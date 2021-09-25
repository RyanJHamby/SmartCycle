//
//  Service.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/14/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import LBTAComponents

class Service {
    static let baseColor = UIColor(r: 0, g: 45, b: 19)
    static let darkBaseColor = UIColor(r: 0, g: 45, b: 19)
    static let unselectedItemColor = UIColor(r: 0, g: 45, b: 19)
    
    static let buttonTitleFontSize: CGFloat = 16
    static let buttonTitleColor = UIColor.white
    static let buttonBackgroundColorSignInAnonymously = UIColor(r: 42, g:12, b: 67)
    static let buttonCornerRadius: CGFloat = 7
    static func showAlert(on: UIViewController, style: UIAlertControllerStyle, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)], completion: (()-> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        on.present(alert, animated: true, completion: completion)
    }
}
