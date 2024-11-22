//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Rodrigo Rezende on 20/04/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var answer: [String]
    var correctAnswer: String
    
    init(question: String, answer: [String], correctAnswer: String) {
        self.question = question
        self.answer = answer
        self.correctAnswer = correctAnswer
    }
}
