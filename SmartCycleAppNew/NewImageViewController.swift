//
//  NewImageViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 6/11/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import AVFoundation
import CoreML
import Vision
import ImageIO
import FirebaseAuth
import Firebase
import Foundation
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class NewImageViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!

    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var overlayCamera: UIView!
    @IBOutlet weak var capButton: UIButton!
    @IBOutlet weak var classificationLabel: UILabel!
    
    var captureDevice:AVCaptureDevice!
    var takePhoto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCamera()
         view.bringSubview(toFront: exitButton);
         view.bringSubview(toFront: classificationLabel);
        self.view.bringSubview(toFront: capButton);
       
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
        classificationLabel.text = "Classifying..."
        
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
    
    /// - Tag: ProcessClassifications
      func processClassifications(for request: VNRequest, error: Error?) {
          DispatchQueue.main.async {
              guard let results = request.results else {
                  self.classificationLabel.text = "Unable to classify image.\n\(error!.localizedDescription)"
                  return
              }
              if results.isEmpty {
                  self.classificationLabel.text = "No recyclable items recognized"
                  return
              }
              // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
              let classifications = (results[0] as AnyObject).labels!
          
              if classifications.isEmpty {
                  self.classificationLabel.text = "Nothing recognized."
              } else {
                  // Display top classifications ranked by confidence in the UI.
                  let topClassifications = classifications.prefix(2)
                  let descriptions = topClassifications.map { classification in
                      // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                      return String(format: "  (%.4f) %@", (classification as AnyObject).confidence, (classification as AnyObject).identifier)
                  }
                  self.addPoints(arr: descriptions)
                 // print("Classification:\n" + descriptions.joined(separator: "\n"))
                  self.classificationLabel.text = "Classification:\n" + descriptions.joined(separator: "\n")
                  
              }
          }
      }
    
    var  db = Firestore.firestore()
     
     func addPoints (arr:[String]) {
         if (!arr[0].contains("plastic") && !arr[0].contains("glass") && !arr[0].contains("can")) {
             self.classificationLabel.text = "No recyclable items recognized"
             return
         }
         else if (!arr[0].contains("1.0") && !arr[0].contains("0.9")) {
             self.classificationLabel.text = "Confidence level must be > 0.9"
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
    
    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        if let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices.first {
            captureDevice = availableDevices
            beginSession()
        }
    }
    
    func beginSession(){
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        } catch {
            print(error.localizedDescription)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            self.previewLayer = previewLayer
            self.view.layer.addSublayer(self.previewLayer)
          //  self.previewLayer.frame = self.view.layer.frame
        self.previewLayer.frame = overlayCamera.bounds
        previewLayer.videoGravity = .resizeAspectFill
            captureSession.startRunning()
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String):NSNumber(value:kCVPixelFormatType_32BGRA)]
            dataOutput.alwaysDiscardsLateVideoFrames = true
            if captureSession.canAddOutput(dataOutput) {
                captureSession.addOutput(dataOutput)
            }
            captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "dlkjfdaskj")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        takePhoto = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if takePhoto {
            takePhoto = false
            if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer) {
                DispatchQueue.main.async {
                    let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "photoVC") as! CameraScanViewController
                    photoVC.takenPhoto = image
                    photoVC.modalPresentationStyle = .fullScreen
                    self.present(photoVC, animated: false, completion: nil)
                }
            }
        }
    }
    
    func getImageFromSampleBuffer (buffer:CMSampleBuffer) -> UIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            if let image = context.createCGImage(ciImage, from: imageRect) {
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }

}
