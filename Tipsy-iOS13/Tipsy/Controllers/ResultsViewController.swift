//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Дмирий Зядик on 26.09.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    var total: Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(total)
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
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
