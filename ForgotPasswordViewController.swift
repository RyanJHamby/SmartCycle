//
//  ForgotPasswordViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/12/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var confirmation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        // Do any additional setup after loading the view.
    }
    
    func setupElements(){
        Utilities.styleTextField(emailTextField)
        Utilities.styleFilledButton(resetPasswordButton)
    }
    @IBAction func resetPushed(_ sender: Any) {
         let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error != nil {
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
            else {
                    self.confirmation.alpha = 1
               }
        }
    }
    
}
