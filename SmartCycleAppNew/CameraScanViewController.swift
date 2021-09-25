//
//  CameraScanViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 6/11/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import CoreML
import Vision
import ImageIO
import FirebaseAuth
import Firebase
import Foundation
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class CameraScanViewController: UIViewController {

    var takenPhoto: UIImage?
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var classLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let availableImage = takenPhoto {
            imageView.image = availableImage
            view.bringSubview(toFront: visualEffect);
            view.bringSubview(toFront: classLabel);
            visualEffect.layer.cornerRadius = 5;
            visualEffect.clipsToBounds  =  true
            visualEffect.trailingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10).isActive = true
            visualEffect.bottomAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 10).isActive = true
            updateClassifications(for: takenPhoto!)
            view.bringSubview(toFront: submitButton)
            classLabel.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
            classLabel.numberOfLines = 0
            if self.canAddPoints == false {
                submitButton.setTitle("Close", for: .normal)
            }

        }
        // Do any additional setup after loading the view.
    }
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    struct FirestoreReferenceManager {
        static let environment = "dev"
        static let db = Firestore.firestore()
        static let root = db.collection(environment).document(environment)
    }
    
    /// - Tag: MLModelSetup
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: BottleDetectora().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    /// - Tag: PerformRequests
    func updateClassifications(for image: UIImage) {
        classLabel.text = "Classifying..."
        
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    var descriptions: Array<String> = []
    var canAddPoints = false
    /// - Tag: ProcessClassifications
      func processClassifications(for request: VNRequest, error: Error?) {
          DispatchQueue.main.async {
              guard let results = request.results else {
                self.classLabel.text = "Unable to classify image.\n\(error!.localizedDescription)"
                  return
              }
              if results.isEmpty {
                  self.classLabel.text = "No recyclable items recognized"
                  return
              }
              // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
              let classifications = (results[0] as AnyObject).labels!
          
              if classifications.isEmpty {
                  self.classLabel.text = "Nothing recognized."
              } else {
                  // Display top classifications ranked by confidence in the UI.
                  let topClassifications = classifications.prefix(2)
                self.descriptions = topClassifications.map { classification in
                      // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                      return String(format: "  (%.4f) %@", (classification as AnyObject).confidence, (classification as AnyObject).identifier)
                  }
                self.canAddPoints = true
                self.submitButton.setTitle("Submit", for: .normal)
                 // print("Classification:\n" + descriptions.joined(separator: "\n"))
                self.classLabel.text = "Classification:\n" + self.descriptions.joined(separator: "\n")
                  
              }
          }
    }
    
    var  db = Firestore.firestore()
     
     func addPoints (arr:[String]) {
         if (!arr[0].contains("plastic") && !arr[0].contains("glass") && !arr[0].contains("can")) {
             self.classLabel.text = "No recyclable items recognized"
             return
         }
         else if (!arr[0].contains("1.0") && !arr[0].contains("0.9")) {
             self.classLabel.text = "Confidence level must be > 0.9"
             return
         }
         else {
             let userCollectionRef = db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
             var points = 0
               userCollectionRef.getDocuments { (snapshot, error) in
                 if let err = error {
                     debugPrint("Error fetching docs: \(err)")
                 } else {
                     guard let snap = snapshot else {return}
                     for document in snap.documents {
                         let data = document.data()
                         points = data["points"] as? Int ?? 0
                         points += 1
                         let ref = self.db.collection("Users").document(Auth.auth().currentUser!.uid)
                         ref.updateData(["points": points])
                     }
                 }
             }
     }
     }
        
    @IBAction func submitButton(_ sender: Any) {
        if (canAddPoints == true) {
            addPoints(arr: self.descriptions)
        }
    }
    
 
}

