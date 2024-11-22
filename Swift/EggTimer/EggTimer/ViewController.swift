//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes=["Soft":300,"Medium":420,"Hard":720]
    
    var totalSeconds = 60.0
    var secondsPassed = 1.0
    var myTimer = Timer()
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @objc func updateTimer() {
        progressBarState.progress = 0
        if totalSeconds > secondsPassed {
            progressBarState.progress = Float(secondsPassed/totalSeconds)
            secondsPassed += 1
        } else {
            myTimer.invalidate()
            secondsPassed=1
            playSound()
            progressBarState.progress = 1
            titleLabelState.text = "Done!"
        }
    }
    @IBOutlet weak var titleLabelState: UILabel!
    
    @IBOutlet weak var progressBarState: UIProgressView!
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        titleLabelState.text = "How do you like your eggs?"
        
        totalSeconds = Double(eggTimes[hardness]!)
        myTimer.invalidate()
        
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        print(eggTimes[hardness]!)
        
        
    }
    
}
