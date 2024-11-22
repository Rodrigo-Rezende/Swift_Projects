//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bill = CashFunctions()
    
    @IBOutlet weak var billTotalAmount: UITextField!
        
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var splitBetweenNumber: UILabel!
    
    @IBOutlet weak var stepperButton: UIStepper!
    
    @IBAction func tipPercentagePress(_ sender: UIButton) {
        bill.split.tipAmount = tipPercentageSelection(tag: sender.tag)
    }
    
    @IBAction func stepButtonPress(_ sender: UIStepper) {
        splitBetweenNumber.text = incrementSplit(value: sender.value)
    }
    
    @IBAction func calculateButtonPress(_ sender: UIButton) {
        bill.split.billTotal = billTotal(totalText: replaceComaWithDot(text: billTotalAmount.text!))
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    
    func tipPercentageSelection(tag: Int) -> Int {
        billTotalAmount.endEditing(true)
        if tag == 0 {
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            return 0
        } else if tag == 1 {
            tenPercentButton.isSelected = true
            zeroPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            return 1
        } else {
            twentyPercentButton.isSelected = true
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            return 2
        }
    }
    
    func billTotal(totalText: String) -> Double{
        return Double(totalText) ?? 0.0
    }
    
    func replaceComaWithDot(text: String) -> String {
        return text.replacingOccurrences(of: ",", with: ".")
    }
    
    func incrementSplit(value: Double) -> String {
        bill.split.splitBetween = value
        return String(format: "%.0f", bill.getSplitBetween())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperButton.value = 2
        billTotalAmount.keyboardType = UIKeyboardType.decimalPad
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPerson = bill.splitPerPerson(total: bill.getBillTotal(), amount: bill.getTipAmount(), between: bill.getSplitBetween())
            destinationVC.amountOfPeople = Int(bill.getSplitBetween())
            destinationVC.tipAmount = bill.getTipAmount()
        }
    }


}

