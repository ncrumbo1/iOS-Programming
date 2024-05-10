//
//  ScoreBoardController.swift
//  Rock Paper Scissor
//
//  Created by Nakia Crumbo on 5/2/24.
//

import UIKit

class ScoreBoardController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    @IBOutlet weak var tableView: UITableView!
    
    var gameResults = [(round: Int, result: String)]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        gameResults[0]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameResults.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let gameResult = gameResults[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(gameResult.round): \(gameResult.result)"
        cell.contentConfiguration = content
        return cell
        
    }
}
    

