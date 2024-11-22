//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress=Float(Double(1)/Double(quizBrain.quiz.count))
        questionText.text=quizBrain.quiz[quizBrain.currentQuestion].question
        scoreLabel.text = "Score: 0 / \(quizBrain.quiz.count)"
        choiceA.setTitle(quizBrain.quiz[quizBrain.currentQuestion].answer[0], for: UIControl.State.normal)
        choiceB.setTitle(quizBrain.quiz[quizBrain.currentQuestion].answer[1], for: UIControl.State.normal)
        choiceC.setTitle(quizBrain.quiz[quizBrain.currentQuestion].answer[2], for: UIControl.State.normal)
    }
    
    
    var quizBrain = QuizBrain()
    
    
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBAction func userAnswerButton(_ sender: UIButton) {
//        print(String(sender.currentTitle!))
        let isCorrect = quizBrain.checkAnswer(answer: String(sender.currentTitle!))
        print(isCorrect)
        sender.backgroundColor = quizBrain.buttonFeedback(answer: isCorrect)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    // Put your code which should be executed with a delay here
                    self.choiceA.backgroundColor = UIColor.clear
                    self.choiceB.backgroundColor = UIColor.clear
                    self.choiceC.backgroundColor = UIColor.clear
                }
        
        scoreLabel.text = "Score: \(quizBrain.getScore()) / \(quizBrain.quiz.count)"
        
        let isLast = quizBrain.isFinalQuestion()
        
        progressBar.progress = quizBrain.progressMeter()
        
        questionText.text = quizBrain.updateQuestion(reset: isLast)
        
        choiceA.setTitle(quizBrain.quiz[quizBrain.currentQuestion].answer[0], for: UIControl.State.normal)
        
        choiceB.setTitle(quizBrain.quiz[quizBrain.currentQuestion].answer[1], for: UIControl.State.normal)
        
        choiceC.setTitle(quizBrain.quiz[quizBrain.currentQuestion].answer[2], for: UIControl.State.normal)
    }
    
}

