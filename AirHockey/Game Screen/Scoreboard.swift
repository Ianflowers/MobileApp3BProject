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
    let screen = UIScreen.main.bounds
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    init() {
        screenWidth = screen.size.width
        screenHeight = screen.size.height
        
        
        playerOneScore = 0
        playerTwoScore = 0
        
        playerOneScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        playerOneScoreLabel.center = CGPoint(x: 160, y: 285)
        playerOneScoreLabel.textAlignment = .center
        playerOneScoreLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        playerTwoScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        playerTwoScoreLabel.center = CGPoint(x: 160, y: 285)
        playerTwoScoreLabel.textAlignment = .center
        playerTwoScoreLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        
        
        playerOneScoreLabel.text = String(playerOneScore)
        playerTwoScoreLabel.text = String(playerTwoScore)
        
        //self.view.addSubview(label)
        
        //
    }
    
}
