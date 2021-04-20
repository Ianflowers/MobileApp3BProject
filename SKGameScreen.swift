//
//  SKGameScreen.swift
//  AirHockey
//
//  Created by Berglund, Brett A on 4/12/21.
//

import SpriteKit

class SKGameScreen: SKScene, SKPhysicsContactDelegate {
    
    var puck: SKShapeNode?
    let puckRadius: CGFloat = 30
    
    override func didMove(to view: SKView) {
        //
        //
        makePuck()
        //
    }
    
    func makePuck() {
        if puck == nil {
            // shape and color
            puck = SKShapeNode(circleOfRadius: puckRadius)
            puck!.fillColor = .black
            puck!.name = "puck"
            puck!.path = CGMutablePath()
            // physics
            puck!.physicsBody = SKPhysicsBody(circleOfRadius: puckRadius)
            puck!.physicsBody?.isDynamic = true
            // weight
            puck!.physicsBody!.mass = 0.02
            puck!.physicsBody!.affectedByGravity = false
            // properties
            puck!.physicsBody!.restitution = 0.85
            puck!.physicsBody!.linearDamping = 0.4
            // position
            puck!.position = CGPoint(x: 0, y: 0)
            puck!.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
            // add to scene if not there
            if puck!.parent == nil {
                addChild(puck!)
            }
        }
    }
    
    // create detection and action on collision
    //func collision(_ force: CGVector, //get from paddle//) {
    // }
    
    // create boundries for puck
    
}
//
