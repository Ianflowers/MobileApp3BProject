//
//  OptionsViewController.swift
//  AirHockey
//
//  Created by Ian Flores on 3/25/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var ptwLabel: UILabel!
    var pointsToWin: Int =         UserDefaults.standard.integer(forKey: "Score")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ptwLabel.adjustsFontSizeToFitWidth = true
        updatePTWLabel()
    }
    
    func updatePTWLabel() { ptwLabel.text = (pointsToWin == 11) ? "∞" : "\(pointsToWin)" }
    
    @IBAction func editPTW(_ sender: UIButton) {
        if sender.accessibilityLabel == "Up" {
            if pointsToWin < 11 {
                pointsToWin += 1
            }
        } else {
            if pointsToWin > 1 {
                pointsToWin -= 1
            }
        }
        updatePTWLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UserDefaults.standard.set(Int(pointsToWin), forKey: "Score")
    }
    
    

}
