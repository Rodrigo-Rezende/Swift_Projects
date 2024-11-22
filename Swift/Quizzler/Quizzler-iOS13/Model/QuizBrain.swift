//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Rodrigo Rezende on 20/04/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    
    var currentQuestion = 0
    var score = 0
    
    let quiz = [
        Question(question: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], correctAnswer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(question: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(question: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    func buttonFeedback(answer: Bool) -> UIColor {
        if answer {
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
    mutating func checkAnswer(answer: String) -> Bool {
        if answer == quiz[currentQuestion].correctAnswer{
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func updateQuestion(reset: Bool) -> String {
        if reset {
            currentQuestion = 0
        }
        return quiz[currentQuestion].question
    }
    
    func progressMeter() -> Float {
        if quiz.count - 1 >= currentQuestion {
            return Float(currentQuestion + 1) / Float(quiz.count)
        } else {
            return 1.0
        }
    }
    
    mutating func isFinalQuestion() -> Bool {
        if currentQuestion < quiz.count - 1 {
            currentQuestion += 1
            return false
        } else {
            currentQuestion = 0
            score = 0
            return true
        }
    }
    
    func getScore() -> Int {
        print(score)
        return score
    }
            
    
}
