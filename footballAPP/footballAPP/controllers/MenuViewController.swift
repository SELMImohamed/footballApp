//
//  MenuViewController.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 11/10/2023.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getAllteams(_ sender: Any) {
        performSegue(withIdentifier: "showDisplayTeams", sender: self)
    }

    
    @IBAction func getAllgames(_ sender: Any) {
        performSegue(withIdentifier: "showDisplayGame", sender: self)
    }
}
