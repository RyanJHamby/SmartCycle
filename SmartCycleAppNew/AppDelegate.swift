//
//  AppDelegate.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/12/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import Firebase
import AWSAppSync
import Amplify
import AmplifyPlugins
import AWSPluginsCore
import AWSMobileClient
//import AWSDataStorePlugin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var appSyncClient: AWSAppSyncClient?
    var window: UIWindow?
    
    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
            do {
                configureAmplify()
                configureAWSAppSync()
                FirebaseApp.configure()
                return true
            }
    }

    func configureAmplify() {
       let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
       do {
           try Amplify.add(plugin: dataStorePlugin)
           try Amplify.configure()
           print("Initialized Amplify");
       } catch {
           // simplified error handling for the tutorial
           print("Could not initialize Amplify: \(error)")
       }
    }
    
    func configureAWSAppSync(){
        do {
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig)
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
        }
        catch {
            print("Error initializing appsync client. \(error)")
        }
    }
}
