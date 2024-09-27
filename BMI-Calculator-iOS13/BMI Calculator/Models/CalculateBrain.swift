//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Дмирий Зядик on 26.09.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float)
    {
        let bmiValue = weight / pow(height, 2)
        bmi = switch bmiValue
        {
            case let x where x < 18.5: BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
            case let x where x < 24.9: BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
            default: BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
    }
    
    func printBMI() -> String {        
        return String(format: "%.2f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String? {
        return bmi?.advice
    }
    
    func getColor() -> UIColor? {
        return bmi?.color
    }
    
}
