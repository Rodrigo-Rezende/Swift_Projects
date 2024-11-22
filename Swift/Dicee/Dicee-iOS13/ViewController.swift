//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceOneImageView: UIImageView!
    @IBOutlet weak var diceTwoImageView: UIImageView!
    
    let diceFaces=[UIImage(named: "DiceOne"),UIImage(named: "DiceTwo"),UIImage(named: "DiceThree"),UIImage(named: "DiceFour"),UIImage(named: "DiceFive"),UIImage(named: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func rollButtonPress(_ sender: UIButton) {
        diceOneImageView.image = diceFaces[Int.random(in: 0...5)]
        diceTwoImageView.image = diceFaces[Int.random(in: 0...5)]
    }
    

}

