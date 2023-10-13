//
//  team.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import Foundation

struct Teams {
    var name : String
    var city : String
    
}

extension Teams {
    init?(json:[String: AnyObject]){
        guard let name = json["full_name"] as? String,
              let city = json["city"] as? String
        else{
            return nil
        }
        
        self.name = name
        self.city = city
    }
}
