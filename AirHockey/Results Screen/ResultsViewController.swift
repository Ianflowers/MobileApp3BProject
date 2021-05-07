//
//  ResultsViewController.swift
//  AirHockey
//
//  Created by Ian Flores on 3/25/21.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var P1_Result: UILabel!
    @IBOutlet var P2_Result: UILabel!
    
    var P1Score: Int!
    var P2Score: Int!
    
//    let screen = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        P1_Result.adjustsFontSizeToFitWidth = true
        P2_Result.adjustsFontSizeToFitWidth = true
        P2_Result.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        P1_Result.text = (P1Score > P2Score) ? "YOU WIN!" : "YOU LOSE!"
        P2_Result.text = (P1Score > P2Score) ? "YOU LOSE!" : "YOU WIN!"
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
