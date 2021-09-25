//
//  IntroViewController.swift
//  Vision+ML Example
//
//  Created by Ryan Hamby on 5/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth

class IntroViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    func alreadySignedIn() {
        let homeVC = self.storyboard?.instantiateViewController(identifier: "tabHome") as? UITabBarController
        self.view.window?.rootViewController = homeVC
        self.view.window?.makeKeyAndVisible()
    }

}
