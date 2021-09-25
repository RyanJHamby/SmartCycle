//
//  HomeTabViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/12/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoggedInUserStatus()
        setupViewControllers()
        self.selectedIndex = 1
        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func checkLoggedInUserStatus(){
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
            let signUpController = UINavigationController(rootViewController: IntroViewController())
            self.present(signUpController,animated: true,completion: nil)
                return
            }
        }
    }
    
    fileprivate func setupViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
let custom  = storyboard.instantiateViewController(withIdentifier: "redNavHome") as! RedeemNavViewController
            let camController  = storyboard.instantiateViewController(withIdentifier: "EarnNavVC") as! EarnNavViewController
        let userProfileController = storyboard.instantiateViewController(withIdentifier: "ProfNavVC") as! ProfileNavViewController
        viewControllers = [custom, camController, userProfileController]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
