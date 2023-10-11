//
//  DisplayAllGamesTableViewController.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 11/10/2023.
//

import UIKit
import WebKit



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

struct HomeTeam {
    var full_name : String
}

extension HomeTeam{
    init?(json:[String: Any]){
        guard let name = json["full_name"] as? String
                
        else{
            return nil
        }
        
        self.full_name = name
        
    }
}

struct VisitorTeam{
    var full_name : String
}

extension VisitorTeam {
    init?(json:[String: Any]){
        guard let name = json["full_name"] as? String
                
        else{
            return nil
        }
        
        self.full_name = name
        
    }
}



class DisplayAllGamesTableViewController: UITableViewController {
    
    
    var browsers : [Games] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let headers = [
            "X-RapidAPI-Key": "bb41e1d1b4msh4f1dfef7e26f6a1p1b5914jsn8f594f0b60e3",
            "X-RapidAPI-Host": "free-nba.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://free-nba.p.rapidapi.com/games?page=0&per_page=25")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [String: AnyObject] {
                        
                        if let items = data["data"] as? [[String: AnyObject]] {
                            print("gg")
                            for item in items {
                                if let game = Games(json: item) {
                                    self.browsers.append(game)
                                }
                            }
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
        
        dataTask.resume()
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.browsers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        
        let game = self.browsers[indexPath.row]
        
        cell.textLabel?.font = UIFont(name: "Arial-BoldMT", size: 14.0)
        
        let homeScoreLabel = UILabel()
        homeScoreLabel.font = UIFont(name: "Arial-BoldMT", size: 16.0)
        homeScoreLabel.text = "\(game.scoreHome)"
        homeScoreLabel.textColor = game.scoreHome > game.scoreVisitor ? UIColor.green : UIColor.red
        
        let visitorScoreLabel = UILabel()
        visitorScoreLabel.font = UIFont(name: "Arial-BoldMT", size: 16.0)
        visitorScoreLabel.text = "\(game.scoreVisitor)"
        visitorScoreLabel.textColor = game.scoreVisitor > game.scoreHome ? UIColor.green : UIColor.red
        
        homeScoreLabel.frame = CGRect(x: cell.contentView.frame.width - 100, y: 10, width: 45, height: 30)
        visitorScoreLabel.frame = CGRect(x: cell.contentView.frame.width - 50, y: 10, width: 45, height: 30)
        
        cell.contentView.addSubview(homeScoreLabel)
        cell.contentView.addSubview(visitorScoreLabel)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = "\(game.id)\nDate: \(game.date)\n\(game.home_team.full_name) vs \(game.visitor_team.full_name)"
        
        print("section : \(indexPath.section) - row : \(indexPath.row)")
        
        return cell
    }
    
}











