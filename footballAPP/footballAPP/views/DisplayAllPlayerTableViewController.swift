//
//  DisplayAllPlayerTableViewController.swift
//  footballAPP
//
//  Created by Florian Cohen-Joly on 12/10/2023.
//

import UIKit

class DisplayAllPlayerTableViewController: UITableViewController {
    
    var browsers : [Players] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers = [
            "X-RapidAPI-Key": "bb41e1d1b4msh4f1dfef7e26f6a1p1b5914jsn8f594f0b60e3",
            "X-RapidAPI-Host": "free-nba.p.rapidapi.com"]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://free-nba.p.rapidapi.com/players?page=0&per_page=100")! as URL,
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
                                if let player = Players(json: item) {
                                    self.browsers.append(player)
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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailPlayer")
            as? DetailPlayerViewController{
            
            let player = self.browsers[indexPath.row]
            
            vc.player = player
            
            self.navigationController?.pushViewController(vc, animated: true)
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        let player = self.browsers[indexPath.row]
        
        cell.textLabel?.text = player.first_name + " " + player.last_name
        
        
        let homeScoreLabel = UILabel()
        homeScoreLabel.font = UIFont(name: "Arial-BoldMT", size: 16.0)
        //        homeScoreLabel.text = "\(player.name)"
        
        let visitorScoreLabel = UILabel()
        visitorScoreLabel.font = UIFont(name: "Arial-BoldMT", size: 16.0)
        //        visitorScoreLabel.text = "\(player.city)"
        
        homeScoreLabel.frame = CGRect(x: cell.contentView.frame.width - 100, y: 10, width: 45, height: 30)
        visitorScoreLabel.frame = CGRect(x: cell.contentView.frame.width - 50, y: 10, width: 45, height: 30)
        
        cell.contentView.addSubview(homeScoreLabel)
        cell.contentView.addSubview(visitorScoreLabel)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        print("section : \(indexPath.section) - row : \(indexPath.row)")
        
        return cell
    }
}
