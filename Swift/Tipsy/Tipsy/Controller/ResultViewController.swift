//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Rodrigo Rezende on 24/04/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalPerPerson : Double?
    var amountOfPeople : Int?
    var tipAmount: Int?

    @IBOutlet weak var amountPerPersonLabel: UILabel!
    @IBOutlet weak var complementFinalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountPerPersonLabel.text = String(format: "%.2f", totalPerPerson!)
        complementFinalLabel.text = "Split between \(amountOfPeople ?? 1), with \(tipFormat())% tip."
        // Do any additional setup after loading the view.
    }
    
    func tipFormat() -> Int {
        if tipAmount == 0 {
            return 0
        } else if tipAmount == 1 {
            return 10
        } else {
            return 20
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
