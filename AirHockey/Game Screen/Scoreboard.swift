//
//  Scoreboard.swift
//  AirHockey
//
//  Created by McKinzie, Jackson D on 3/29/21.
//

import Foundation
import UIKit

class Scoreboard {
    
    var playerOneScore: Int
    var playerTwoScore: Int
    let screen = UIScreen.main.bounds
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    init(scoreLabel: UILabel) {
        screenWidth = screen.size.width
        screenHeight = screen.size.height
        
        
        playerOneScore = 0
        playerTwoScore = 0

        scoreLabel.center = CGPoint(x: 20, y: screenHeight / 2)
        scoreLabel.textAlignment = .center
        scoreLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        
        
        scoreLabel.text = String("\(playerOneScore)       \(playerTwoScore)")
        
        //view.addSubview(playerOneScoreLabel)
        
        //
    }
    
}
