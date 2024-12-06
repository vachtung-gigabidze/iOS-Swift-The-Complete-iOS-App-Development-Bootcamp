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
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
//    init(number: Double? = nil) {
//        self.number = number
//    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            }
           
             else if symbol == "=" {
                 return performTwoNumbercalculation(n2: n)
            }
            else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
           }
        }
    
        return nil
    }    
    func performTwoNumbercalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            if operation == "+" {
               return n1 + n2
            }
            if operation == "-" {
               return n1 - n2
            }
            if operation == "×" {
               return n1 * n2
            }
            if operation == "÷" {
               return n1 / n2
            }
            fatalError("Error")
        }
        
        return nil
    }
}
