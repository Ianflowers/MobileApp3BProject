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
        // Do any additional setup after loading the view.
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func goHome(unwindSegue: UIStoryboardSegue) { viewDidLoad() }
    
}

