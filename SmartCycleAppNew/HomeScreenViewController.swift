//
//  HomeScreenViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/30/21.
//  Copyright © 2021 ecoSolve. All rights reserved.
//

import SwiftUI
import Amplify
import AmplifyPlugins
import AWSAppSync

class HomeScreenViewController: UIViewController {
    
    var appSyncClient: AWSAppSyncClient?
    // var deltaWatcher: Cancellable?
    
    @IBOutlet weak var location: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Reference AppSync client from App Delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
       // print("Reached print statement")
        //self.location.text = "reached"
        getLocation();
       // performOnAppear()
    }
    
    private func configureAmplify() {
        do {
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: models))
            try Amplify.configure();
            print("Configured amplify")
        } catch {
            print("Couldnt configure amplify",error)
        }
    }

    func performOnAppear() {
       Amplify.DataStore.query(Todo.self) { result in
           switch(result) {
           case .success(let todos):
                print("got to todo")
               for todo in todos {
                   print("==== Todo ====")
             //      print("Name: \(todo.name)")
                 //  if let priority = todo.priority {
                //       print("Priority: \(priority)")
               //    }
                   if let description = todo.description {
                       print("Description: \(description)")
                   }
               }
           case .failure(let error):
               print("Could not query DataStore: \(error)")
           }
       }
    }
    
    /*
    func getTodo() {
        Amplify.API.query(request: .get(Todo.self, : "")) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let todo):
                    guard let todo = todo else {
                        print("Could not find todo")
                        return
                    }
                    print("Successfully retrieved todo: \(todo)")
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    } */
    
    func getLocation() {
    appSyncClient?.fetch(query: GetRpi1Query(mac_Id: "e4:5f:01:1a:90:2a"))  { (result, error) in
       if error != nil {
        print(error?.localizedDescription ?? "")
        print("reached print statement")
           return
       }
        if let resultError = result?.errors{
            print("Error saving the item on server: \(resultError)")
            return
        }
        else {
            print(result?.data?.getRpi1?.ts)
           // self.location.text = result?.data?.getRpi1?.randomString
        }
   }
    }
}
