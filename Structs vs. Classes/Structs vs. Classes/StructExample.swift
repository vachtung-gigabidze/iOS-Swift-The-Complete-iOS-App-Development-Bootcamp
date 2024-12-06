//
//  StructExample.swift
//  Structs vs. Classes
//
//  Created by Дмирий Зядик on 06.12.2024.
//

import Foundation


struct StructHero {
    var name:String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}


