//
//  DetailPlayerViewController.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import UIKit

class DetailPlayerViewController: UIViewController {
    
   
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var postion: UILabel!
    
    var player: Players?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let player = player {
            
           
            lastName.text = "\(player.last_name)"
            firstName.text = "\(player.first_name)"
            postion.text = "Position = " + "\(player.position)"
            
        }
    }
}
