//
//  Paddle.swift
//  AirHockey
//
//  Created by Ian Flores on 3/31/21.
//

import Foundation
import UIKit

class Paddle: UIImageView {
    
    var minX, minY, maxX, maxY: CGFloat!

    func setPaddle(gesture: UIGestureRecognizer, minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) {
        self.addGestureRecognizer(gesture)
        self.minX = minX
        self.maxX = maxX
        self.minY = minY
        self.maxY = maxY
    }
    
    func check(_ gesture: UIPanGestureRecognizer, in view: UIView) {
        let translation = gesture.translation(in: view)
        guard let gestureView = gesture.view else {
            return
        }
        gestureView.center = CGPoint( x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
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
