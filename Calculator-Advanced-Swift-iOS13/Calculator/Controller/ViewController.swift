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
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculateLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishTypingNumber = true
        
        calculator.setNumber(displayValue)
//        guard let number = Double(displayLabel.text!) else {
//            fatalError("Error")
//        }
        
        if let calcMethod = sender.currentTitle {
           
            
            if let result = calculator.calculate(symbol: calcMethod)  {
                displayValue = result
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
                if numValue == "." {
//                    guard let currentDisplayValue = Double(displayLabel.text!) else {
//                        fatalError("Error")
//                    }
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
        
        
    }

}

