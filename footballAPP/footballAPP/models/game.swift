//
//  GameModel.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import Foundation

struct Games {
    var home_team : HomeTeam
    var visitor_team : VisitorTeam
    var id : Int
    var date : String
    var scoreHome : Int
    var scoreVisitor : Int
}

extension Games {
    init?(json:[String: AnyObject]){
        guard let home_team = json["home_team"] as? [String: Any],
              let visitor_team = json["visitor_team"] as? [String: Any],
              let id = json["id"] as? Int,
              let date = json["date"] as? String,
              let scoreHome = json["home_team_score"] as? Int,
              let scoreVisitor = json["visitor_team_score"] as? Int
        
        else{
            return nil
        }
        
        self.home_team = HomeTeam(json: home_team)!
        self.visitor_team = VisitorTeam(json: visitor_team)!
        self.id = id
        self.date = date
        self.scoreHome = scoreHome
        self.scoreVisitor = scoreVisitor
    }
}
