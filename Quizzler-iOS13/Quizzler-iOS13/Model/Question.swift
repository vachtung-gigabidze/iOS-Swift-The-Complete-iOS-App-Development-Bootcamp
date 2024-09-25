//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Дмирий Зядик on 24.09.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let answer: String
    
    init(q:String, a:[String], correctAnswer:String){
        text = q
        answers = a
        answer = correctAnswer
    }
    
}
