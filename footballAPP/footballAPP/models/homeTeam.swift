//
//  homeTeam.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import Foundation


struct HomeTeam {
    var full_name: String
}

extension HomeTeam {
    init?(json: [String: Any]) {
        guard let name = json["full_name"] as? String else {
            return nil
        }
        
        self.full_name = name
    }
}
