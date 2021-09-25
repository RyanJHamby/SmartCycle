//
//  CamToScanSegue.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 6/10/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit

class CamToScanSegue: UIStoryboardSegue  {
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if let tabVC = segue.destination as? UITabBarController{
                tabVC.selectedIndex = 2
            }
        
    }
    override func perform() {
        let src: UIViewController = self.source
        let dst: UIViewController = self.destination
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        src.navigationController!.view.layer.add(transition, forKey: kCATransition)
        src.navigationController!.pushViewController(dst, animated: false)
    }
}
