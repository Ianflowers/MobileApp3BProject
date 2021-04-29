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
        makeBorders()
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
    func collision(_ force: CGVector, fromPaddle paddle: Paddle) {
        let collisionDistanceSqrd = (paddle.radius * paddle.radius) + (puckRadius * puckRadius)
        let distanceX = paddle.center.x - puck!.position.x
        let distanceY = paddle.center.y - puck!.position.y
        let distanceSqrd = (distanceX * distanceX) + (distanceY * distanceY)
        if distanceSqrd <= collisionDistanceSqrd {
            puck!.physicsBody!.applyImpulse(force)
        }
     }
    
    //Checks for anything off screen
    func isOffScreen(node: SKShapeNode) -> Bool {
        return !frame.contains(node.position)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isOffScreen(node: puck!) {
            makePuck()
        }
    }
    
    // create boundries for puck
    func makeBorders() {
        let borderWidth = CGFloat(20.0)
        
        //Left border
        let leftBorder = SKSpriteNode(color: UIColor.black, size: CGSize(width: borderWidth, height: size.height))
        leftBorder.position = CGPoint(x: borderWidth, y: frame.height/2)
        
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        leftBorder.physicsBody!.isDynamic = false
        addChild(leftBorder)
        
        //Right border
        let rightBorder = SKSpriteNode(color: UIColor.black, size: CGSize(width: borderWidth, height: size.height))
        rightBorder.position = CGPoint(x: size.width - borderWidth/2, y: frame.height/2)
        addChild(rightBorder)
        
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: rightBorder.size)
        rightBorder.physicsBody!.isDynamic = false
        addChild(rightBorder)
        
        //Table ends
        let endBorderWidth = (size.width / 2) - 150
        let endBorderSize = CGSize(width: endBorderWidth, height: borderWidth)
        let endBorderPhysics = SKPhysicsBody(rectangleOf: endBorderSize)
        endBorderPhysics.isDynamic = false
        
        //Create all of the borders
        
        //Bottom Left
        let bottomLeftBorder = SKSpriteNode(color: UIColor.black, size: endBorderSize)
        bottomLeftBorder.position = CGPoint(x: endBorderWidth/2, y: borderWidth/2)
        bottomLeftBorder.physicsBody = endBorderPhysics
        addChild(bottomLeftBorder)
        
        //Bottom Right
        let bottomRightBorder = bottomLeftBorder.copy() as! SKSpriteNode
        bottomRightBorder.position = CGPoint(x: size.width - endBorderWidth/2, y: borderWidth/2)
        addChild(bottomRightBorder)
        
        //Top Left
        let topLeftBorder = bottomLeftBorder.copy() as! SKSpriteNode
        topLeftBorder.position = CGPoint(x: endBorderWidth/2, y: size.height - borderWidth/2)
        addChild(topLeftBorder)
        
        //Top Right
        let topRightBorder = bottomLeftBorder.copy() as! SKSpriteNode
        topRightBorder.position = CGPoint(x: size.width - endBorderWidth/2, y: size.height - borderWidth/2)
        addChild(topRightBorder)
    }
    
}
//
