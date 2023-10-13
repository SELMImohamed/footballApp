//
//  HomeViewController.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 11/10/2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
}


class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushHome(_ sender: UIButton) {
        
        sender.pulsate()
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tabbar") as? MainTabBarController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
    }
}
