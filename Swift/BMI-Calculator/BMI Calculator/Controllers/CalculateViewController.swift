//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func horizontalSlider(_ sender: UISlider) {
        if sender.tag == 1 {
            heightLabel.text = String(format: "%.2fm", sender.value)
        } else {
            weightLabel.text = String(format: "%.0fKg", sender.value.rounded())
        }
    }
    
    
    @IBAction func calculateButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiResult = Double(calculatorBrain.calculate(height: heightSlider.value, weight: weightSlider.value)) 
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.setValue(1.5, animated: false)
        weightSlider.setValue(100, animated: false)
    }


}

