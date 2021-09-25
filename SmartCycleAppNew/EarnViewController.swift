//
//  EarnViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/13/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit

class EarnViewController: UIViewController {
    @IBOutlet weak var RecyclingBinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
   //     let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
      //  let custom  = storyboard.instantiateViewController(withIdentifier: "EarnVC") as! EarnViewController
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
