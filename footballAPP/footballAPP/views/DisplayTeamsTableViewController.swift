//
//  DisplayTeamsTableViewController.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 10/10/2023.
//

import UIKit
import WebKit


class DisplayTeamsTableViewController: UITableViewController {
    
    var browsers : [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let headers = [
            "X-RapidAPI-Key": "bb41e1d1b4msh4f1dfef7e26f6a1p1b5914jsn8f594f0b60e3",
            "X-RapidAPI-Host": "free-nba.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://free-nba.p.rapidapi.com/teams?page=0")! as URL,
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
                            for item in items {
                                if let team = Teams(json: item) {
                                    self.browsers.append(team)
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.browsers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let teams = self.browsers[indexPath.row]
        
        //let teams = self.browsers[indexPath.row]
        cell.textLabel?.text = "\(teams.city)\n\(teams.name)"
        
        print("section : \(indexPath.section) - row : \(indexPath.row)")
        
        return cell
    }
}
