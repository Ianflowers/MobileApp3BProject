//
//  Scoreboard.swift
//  AirHockey
//
//  Created by McKinzie, Jackson D on 3/29/21.
//

import Foundation
import UIKit

class Scoreboard {
    
    var playerOneScoreLabel: UILabel
    var playerTwoScoreLabel: UILabel
    var playerOneScore: Int
    var playerTwoScore: Int
    
    init() {
        playerOneScore = 0
        playerTwoScore = 0
        
        playerOneScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        playerOneScoreLabel.center = CGPoint(x: 160, y: 285)
        playerOneScoreLabel.textAlignment = .center
        
        
        playerTwoScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        playerOneScoreLabel.center = CGPoint(x: 160, y: 285)
        playerOneScoreLabel.textAlignment = .center
        
        
        
        playerOneScoreLabel.text = String(playerOneScore)
        playerTwoScoreLabel.text = String(playerTwoScore)
        
        //self.view.addSubview(label)
    }
    
}
