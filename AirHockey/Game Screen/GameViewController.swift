//
//  GameViewController.swift
//  AirHockey
//
//  Created by Ian Flores on 3/25/21.
//

import UIKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var P1Paddle: Paddle!
    @IBOutlet var P1PanGesture: UIPanGestureRecognizer!
    @IBOutlet var P2Paddle: Paddle!
    @IBOutlet var P2PanGesture: UIPanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func paddleTouch(_ gesture: UIPanGestureRecognizer) {
        if gesture.view!.accessibilityLabel == "P1" {
            P1Paddle.check(gesture, in: view)
        } else {
            P2Paddle.check(gesture, in: view)
        }
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) { }
    

}

extension ViewController: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool { return true }
  
}
