//
//  CalculateLogic.swift
//  Calculator
//
//  Created by Дмирий Зядик on 06.12.2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculateLogic {
    
    private var number:Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
//    init(number: Double? = nil) {
//        self.number = number
//    }
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            }
             else if symbol == "+" {
                return n * 0.01
            }
             else if symbol == "=" {
                return n * 0.01
            }
        }
    
        return nil
    }    

}
