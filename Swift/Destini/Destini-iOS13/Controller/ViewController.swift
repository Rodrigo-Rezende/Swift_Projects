//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.updatePath(tag: sender.tag)
        updateUI()
        
    }
    
    func updateUI () {
        storyLabel.text = storyBrain.newStageTitle()
        choice1Button.setTitle(storyBrain.newStageChoice1(), for: UIControl.State.normal)
        choice2Button.setTitle(storyBrain.newStageChoice2(), for: UIControl.State.normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storyBrain.stories[0].title
        choice1Button.setTitle(storyBrain.stories[0].choice1, for: UIControl.State.normal)
        choice2Button.setTitle(storyBrain.stories[0].choice2, for: UIControl.State.normal)
    }

}

