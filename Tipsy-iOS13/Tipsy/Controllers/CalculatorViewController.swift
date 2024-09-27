//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTExtField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedPCt: Float = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = zeroPctButton.currentTitle == sender.currentTitle
        tenPctButton.isSelected = tenPctButton.currentTitle == sender.currentTitle
        twentyPctButton.isSelected = twentyPctButton.currentTitle == sender.currentTitle
        
        selectedPCt = [0.0,0.1,0.2][[zeroPctButton.isSelected, tenPctButton.isSelected, twentyPctButton.isSelected].firstIndex(where: {$0 == true})!]
        
        billTExtField.endEditing(true)
        
    }
    
    @IBAction func stepperValuerChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        let bill = Float(billTExtField.text ?? "0.0")
        let splitNumber = Float(splitNumberLabel.text ?? "0")
        print((bill! * selectedPCt + bill!) / splitNumber!)
    }
    
}

