//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //var tipsy = TipsyBrain(bill: 0, percent: 0, splitNumber: 0)
    
    @IBOutlet weak var billTExtField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedPCt: Int = 0
    var total: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = zeroPctButton.currentTitle == sender.currentTitle
        tenPctButton.isSelected = tenPctButton.currentTitle == sender.currentTitle
        twentyPctButton.isSelected = twentyPctButton.currentTitle == sender.currentTitle
        
        selectedPCt = [0,10,20][[zeroPctButton.isSelected, tenPctButton.isSelected, twentyPctButton.isSelected].firstIndex(where: {$0 == true})!]
        
        billTExtField.endEditing(true)
        
    }
    
    @IBAction func stepperValuerChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {        
        
        let bill = Float(billTExtField.text ?? "0.0")
        let splitNumber = Float(splitNumberLabel.text ?? "0")
        total = (bill! * Float(selectedPCt/100) + bill!) / splitNumber!
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = total
            destinationVC.splitNumberText = splitNumberLabel.text!
            destinationVC.percentText = String(selectedPCt)
            
    }
}
}

