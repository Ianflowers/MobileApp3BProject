//
//  MenuViewController.swift
//  AirHockey
//
//  Created by Ian Flores on 3/23/21.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "Score") == nil {
            UserDefaults.standard.set(Int(5), forKey: "Score")
        }
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func goHome(unwindSegue: UIStoryboardSegue) { viewDidLoad() }
    
}

