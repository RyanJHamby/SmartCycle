//
//  AppManager.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/13/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import Firebase

class AppManager {
    static let shared = AppManager()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var appContainer: AppContainerViewController!
    
    private init() { }
    
    func showApp() {
    var viewController: UIViewController
    
    if Auth.auth().currentUser == nil {
        viewController = storyboard.instantiateViewController(withIdentifier: "introNAV")
    }
    else {
        viewController = storyboard.instantiateViewController(identifier: "tabHome")
        }
        viewController.modalPresentationStyle = .fullScreen
        appContainer.present(viewController, animated: false)
    }
    
    func logout() {
        try! Auth.auth().signOut()
        appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
