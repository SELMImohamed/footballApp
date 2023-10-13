//
//  UIButtonExtension.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import UIKit


extension UIButton {
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1.4
        pulse.fromValue = 1.10   //0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
    
        layer.add(pulse, forKey: nil)
    }
}
