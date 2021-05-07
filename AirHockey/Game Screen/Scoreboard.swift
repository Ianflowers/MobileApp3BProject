//
//  Scoreboard.swift
//  AirHockey
//
//  Created by McKinzie, Jackson D on 3/29/21.
//

import Foundation
import UIKit

class Scoreboard {
    
    var P1Score: Int
    var P2Score: Int
    let screenHeight: CGFloat
    let scoreLabel: UILabel
    
    init(scoreLabel: UILabel) {
        self.scoreLabel = scoreLabel
        screenHeight = UIScreen.main.bounds.size.height
        
        P1Score = 0
        P2Score = 0

        self.scoreLabel.center = CGPoint(x: 40, y: screenHeight / 2)
        self.scoreLabel.textAlignment = .center
        self.scoreLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        self.scoreLabel.font = scoreLabel.font.withSize(50)
        self.scoreLabel.text = String("\(P1Score)\t\t\(P2Score)")
    }
    
    func updateScore(whoScored: Int) {
        if whoScored == 1 {
            P1Score += 1
        } else {
            P2Score += 1
        }
        scoreLabel.text = String("\(P1Score)\t\t\(P2Score)")
    }
    
}
