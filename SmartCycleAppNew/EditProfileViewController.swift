//
//  EditProfileViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/18/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase
import SDWebImage
import FirebaseDatabase
import FirebaseStorage

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    // firstName
    @IBOutlet weak var usernameText: UITextField!
    
    //lastName
    @IBOutlet weak var displayNameText: UITextField!
            var databaseRef: DatabaseReference!
            var storageRef: StorageReference!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                databaseRef = Database.database().reference()
                storageRef = Storage.storage().reference()
                loadProfileData()
            }
        

    @IBAction func saveProfileData(_ sender: Any) {
            updateUsersProfile()
        }
    
        @IBAction func cancel(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }  
    @IBAction func getPhotoFromLibrary(_ sender: Any) {
            //create instance of Image picker controller
            let picker = UIImagePickerController()
            //set delegate
            picker.delegate = self
            //set details
                //is the picture going to be editable(zoom)?
            picker.allowsEditing = true
                //what is the source type
            picker.sourceType = .photoLibrary
                //set the media type
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            //show photoLibrary
            present(picker, animated: true, completion: nil)
        }

        func updateUsersProfile(){
          //check to see if the user is logged in
            if let userID = Auth.auth().currentUser?.uid{
            //create an access point for the Firebase storage
                let storageItem = storageRef.child("Users").child(userID)
            //get the image uploaded from photo library
                guard let image = profileImageView.image else {return}
                if let newImage = UIImageJPEGRepresentation(image, 1){
            //upload to firebase storage

                    storageItem.putData(newImage, metadata: nil, completion: { (metadata, error) in
                        if error != nil{
                            print(error!)
                            return
                        }
                        storageItem.downloadURL(completion: { (url, error) in
                            if error != nil{
                                print(error!)
                                return
                            }
                            if let profilePhotoURL = url?.absoluteString{
                                guard let newUserName  = self.usernameText.text else {return}
                                guard let newDisplayName = self.displayNameText.text else {return}
                                let db = Firestore.firestore()
                          let ref = db.collection("Users").document(Auth.auth().currentUser!.uid)
                                ref.updateData(["photo": profilePhotoURL,
                                                             "firstName": newDisplayName,
                                                             "lastName": newUserName
                                                             ])
                                    print("Profile Successfully Update")
                            }
                        })
                    })
          
                }
            }
        }


            
        //what happens when the user selects a photo?
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            //create holder variable for chosen image
            var chosenImage = UIImage()
            //save image into variable
            print(info)
            chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            //update image view
            profileImageView.image = chosenImage
            profileImageView.layer.cornerRadius = 50
            //dismiss
            dismiss(animated: true, completion: nil)
        }
    
        //what happens when the user hits cancel?
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
        
        func loadProfileData(){
             let db = Firestore.firestore()
           // let userID = Auth.auth().currentUser!.uid
            let userCollectionRef = db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
             userCollectionRef.getDocuments { (snapshot, error) in
                 if let err = error {
                     debugPrint("Error fetching docs: \(err)")
                 } else {
                     guard let snap = snapshot else {return}
                     for document in snap.documents {
                         let data = document.data()
                        if let profileImageURL = data["photo"] as? String{
                                             //using sd_setImage load photo
                                             self.profileImageView.sd_setImage(with: URL(string: profileImageURL), placeholderImage: UIImage(named: "default_user_icon"))
                            self.profileImageView.layer.cornerRadius = 50
                                         }
                        self.usernameText.text = data["lastName"] as? String
                        self.displayNameText.text = data["firstName"] as? String
                     }
                 }
               }
            }//end of loadProfileData
    }
