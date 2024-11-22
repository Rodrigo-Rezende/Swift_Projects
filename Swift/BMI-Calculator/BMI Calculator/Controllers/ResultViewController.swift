//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Rodrigo Rezende on 22/04/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    var bmiResult = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%.2f", bmiResult)
        backgroundColorAccordingToBmi()
    }
    
    func backgroundColorAccordingToBmi() {
        if bmiResult > 18.5 {
            resultBackground.backgroundColor = .systemGreen
            adviceLabel.text = "You are eating right!"
            if bmiResult > 24.9 {
                resultBackground.backgroundColor = .systemOrange
                adviceLabel.text = "Watch out for the extra snacks!"
                if bmiResult > 29.9 {
                    resultBackground.backgroundColor = .systemRed
                    adviceLabel.text = "You are dying fatty!"
                }
            }
        } else {
            resultBackground.backgroundColor = .systemBlue
            adviceLabel.text = "Time to eat some more!"
        }
    }
    
    @IBAction func recalculateButtonPress(_ sender: UIButton) {
         dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
