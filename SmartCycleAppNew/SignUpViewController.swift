//
//  SignUpViewController.swift
//  Vision+ML Example
//
//  Created by Ryan Hamby on 5/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var signUpBotton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        Utilities.styleTextField(FirstName)
        Utilities.styleTextField(LastName)
        Utilities.styleTextField(Email)
        Utilities.styleTextField(Password)
        Utilities.styleFilledButton(signUpBotton)
    }
    
    func validateFields() -> String? {
        if FirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || LastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || Email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        let cleanedPassword = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Password must have at least 8 characters, at least one special character, and at least one number"
        }
        return nil
    }
    
    var ref: DatabaseReference!
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            let firstName = FirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = LastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    let  db = Firestore.firestore()
                    let ewId = result!.user.uid

                    db.collection("Users").document(ewId).setData( [
                        "firstName": firstName,
                        "lastName": lastName,
                        "photo": "",
                        "points": 0,
                        "uid": ewId]
                    )
                 /*   db.collection("Users").addDocument(data: ["firstName":firstName,"lastName":lastName,"uid":result!.user.uid, "points": 0]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data. Please create a new account")
                        }
                    } */
                    self.transitionToHome()
                }
                
            }
        }
    }

    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeVC = storyboard?.instantiateViewController(identifier: "tabHome") as? UITabBarController
        view.window?.rootViewController = homeVC
        view.window?.makeKeyAndVisible()
    }
}
