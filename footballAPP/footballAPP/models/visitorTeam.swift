//
//  visitor.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import Foundation


struct VisitorTeam {
    var full_name: String
}

extension VisitorTeam {
    init?(json: [String: Any]) {
        guard let name = json["full_name"] as? String else {
            return nil
        }
        
        self.full_name = name
    }
}
