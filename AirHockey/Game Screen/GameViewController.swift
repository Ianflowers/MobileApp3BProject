//
//  GameViewController.swift
//  AirHockey
//
//  Created by Ian Flores on 3/25/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var P1Paddle: Paddle!
    @IBOutlet var P1PanGesture: UIPanGestureRecognizer!
    @IBOutlet var P2Paddle: Paddle!
    @IBOutlet var P2PanGesture: UIPanGestureRecognizer!
    var scoreboard: Scoreboard!
    @IBOutlet var playerScoreLabel: UILabel!
    var currentGame: SKGameScreen?
    
    var pointsToWin: Int = UserDefaults.standard.integer(forKey: "Score")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = SKScene(fileNamed: "SKGameScene") {
            let skView = self.view as! SKView
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            scene.size = skView.frame.size
            skView.presentScene(scene)
            //currentGame = scene as?
            //currentGame?.viewController = self
        }
        
        scoreboard = Scoreboard(scoreLabel: playerScoreLabel)
        paddleSetUp()
    }
    
    func paddleSetUp() {
        P2Paddle.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 4.8)
        P1Paddle.center = CGPoint(x: P2Paddle.center.x, y: P2Paddle.center.x * 3.5)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.delegate = self
        P1Paddle.setPaddle(name: "P1", gesture: tapGesture, minX: 32, minY: 476, maxX: 382, maxY: 830)
        P2Paddle.setPaddle(name: "P2", gesture: tapGesture, minX: 32, minY: 74, maxX: 382, maxY: 417)
    }
    
    func checkForWin() {
        if scoreboard.P1Score >= pointsToWin || scoreboard.P2Score >= pointsToWin {
            prepare(for: UIStoryboardSegue(identifier: "toResults", source: self, destination: ResultsViewController()), sender: self)
            performSegue(withIdentifier: "toResults", sender: self)
        }
    }
    
    @IBAction func paddleTouch(_ gesture: UIPanGestureRecognizer) {
        if gesture.view!.accessibilityLabel == "P1" {
            P1Paddle.check(gesture, in: view)
            scoreboard.updateScore(whoScored: 1)
        } else {
            P2Paddle.check(gesture, in: view)
            scoreboard.updateScore(whoScored: 2)
        }
        checkForWin()
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ResultsViewController = segue.destination as? ResultsViewController
        else {
            guard let PauseViewController = segue.destination as? PauseViewController
            else {
                return
            }
            PauseViewController.P1Score = scoreboard.P1Score
            PauseViewController.P2Score = scoreboard.P2Score
            return
        }
        ResultsViewController.P1Score = scoreboard.P1Score
        ResultsViewController.P2Score = scoreboard.P2Score
    }
    
    @IBAction func newGame(unwindSegue: UIStoryboardSegue) {
        viewDidLoad()
        scoreboard.P1Score = 0
        scoreboard.P2Score = 0
    }
    
    @IBAction func continueGame(unwindSegue: UIStoryboardSegue) { }

}
