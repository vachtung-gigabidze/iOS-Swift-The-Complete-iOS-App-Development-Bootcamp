//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    internal var isFinishTypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Error")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(Int(number) * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
        
        
//        let string = String(12)
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
                
        if let numValue = sender.currentTitle {
            if isFinishTypingNumber {
                displayLabel.text = numValue
                isFinishTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
        
        
    }

}

