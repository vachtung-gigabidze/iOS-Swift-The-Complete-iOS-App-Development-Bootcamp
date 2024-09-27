//
//  tipsyBrain.swift
//  Tipsy
//
//  Created by Дмирий Зядик on 27.09.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

struct TipsyBrain {
    
    var bill: Float = 0.0
    var percent: Int = 0
    var splitNumber: Int = 0
    
    init(bill: Float, percent: Int, splitNumber: Int) {
        self.bill = bill
        self.percent = percent
        self.splitNumber = splitNumber
    }
    
    func calculateTotal() -> Float {
        return (bill * (Float(percent)/100.0) + bill) / Float(splitNumber)
    }
}
