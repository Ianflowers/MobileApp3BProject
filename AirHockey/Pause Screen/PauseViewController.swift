//
//  PauseViewController.swift
//  AirHockey
//
//  Created by Ian Flores on 3/25/21.
//

import UIKit

class PauseViewController: UIViewController {

    @IBOutlet var scoreboard: UILabel!
    var pointsToWin: Int!
    var P1Score: Int!
    var P2Score: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreboard.text = "\(P1Score!) - \(P2Score!)"
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
