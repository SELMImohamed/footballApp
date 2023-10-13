//
//  player.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import Foundation


struct Players {
    
    var id : Int
    var first_name : String
    var last_name : String
    var position : String
    //    var name : Teams
    //    var city : Teams
}

extension Players {
    init?(json:[String: Any]){
        guard let first_name = json["first_name"] as? String,
              let last_name = json["last_name"] as? String,
              let id = json["id"] as? Int,
              let position = json["position"] as? String
            //let name = json["name"] as? [String: Any],
            //let city = json["city"] as? [String: Any]
                
        else{
            return nil
        }
        
        //self.name = Teams(json: name)!
        //self.city = Teams(json: city)!
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.position = position
    }
}
