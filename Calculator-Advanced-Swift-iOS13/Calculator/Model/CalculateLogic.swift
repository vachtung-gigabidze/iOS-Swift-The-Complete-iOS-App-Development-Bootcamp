//
//  CalculateLogic.swift
//  Calculator
//
//  Created by Дмирий Зядик on 06.12.2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculateLogic {
    
    var number:Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number * 0.01
        }
    
        return nil
    }    

}
