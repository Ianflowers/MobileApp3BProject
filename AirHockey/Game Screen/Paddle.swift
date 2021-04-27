//
//  Paddle.swift
//  AirHockey
//
//  Created by Ian Flores on 3/31/21.
//

import Foundation
import UIKit
import SpriteKit

class Paddle: UIImageView {
    
    var name: String!
    var minX, minY, maxX, maxY: CGFloat!

    func setPaddle(name: String, gesture: UIGestureRecognizer, minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) {
        self.name = name
        self.addGestureRecognizer(gesture)
        self.minX = minX
        self.maxX = maxX
        self.minY = minY
        self.maxY = maxY
    }
    
    func check(_ gesture: UIPanGestureRecognizer, in view: UIView) {
        let translation = gesture.translation(in: view)
        let point = gesture.location(in: view)
        guard let gestureView = gesture.view else {
            return
        }
        
        if point.y <= minY && self.name == "P1" && translation.y > 0 {
            gestureView.center = CGPoint( x: gestureView.center.x + translation.x, y: gestureView.center.y)
        } else if point.y >= maxY && self.name == "P2" && translation.y < 0 {
            gestureView.center = CGPoint( x: gestureView.center.x + translation.x, y: gestureView.center.y)
        } else {
            gestureView.center = CGPoint( x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        }
        if gestureView.center.x < minX {
            gestureView.center.x = minX
        }
        if gestureView.center.x > maxX {
            gestureView.center.x = maxX
        }
        if gestureView.center.y < minY {
            gestureView.center.y = minY
        }
        if gestureView.center.y > maxY {
            gestureView.center.y = maxY
        }
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else {
            return
        }
    }
    
    
}
