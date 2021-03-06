//
//  ViewController.swift
//  Memory
//
//  Created by Chris Withers on 7/8/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    @IBOutlet weak var LevelLabel: UILabel!
    @IBOutlet weak var GameInstructions: UILabel!
    @IBOutlet weak var NextLevel: UIButton!
    @IBOutlet weak var highScore: UILabel!
    
    var currentLevel: Int = 0
    //var highScore: Int = 0
    var currentPattern: [Int] = []
    var userPattern: [Int] = []
    var currentIndex: Int = 0
    var userIndex: Int = 0
    
    let defaults = UserDefaults.standard
    
    var timer = Timer()
    
    @IBAction func NewGame(_ sender: UIButton) {
        newLevel()
        
    }
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        sender.flash()
        userPattern.append(0)
        verifyPattern()
        
        
    }
    
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        sender.flash()
        userPattern.append(1)
        verifyPattern()
    }
    
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        sender.flash()
        userPattern.append(2)
        verifyPattern()
    }
    
    
    @IBAction func yellowButtonPressed(_ sender: UIButton) {
        sender.flash()
        userPattern.append(3)
        verifyPattern()
    }
    
    
    func newLevel() {
        
        timer.invalidate()
        greenButton.isUserInteractionEnabled = true
        redButton.isUserInteractionEnabled = true
        blueButton.isUserInteractionEnabled = true
        yellowButton.isUserInteractionEnabled = true
        NextLevel.isUserInteractionEnabled = false
        
        currentLevel += 1
        LevelLabel.text = "Level: \(String(currentLevel))"
        
        if currentLevel >= defaults.integer(forKey: "HighScore") {
            defaults.set(currentLevel, forKey: "HighScore")
            highScore.text = "High Score: \(defaults.integer(forKey: "HighScore"))"
        }
        
        currentIndex = 0
        userIndex = 0
        userPattern = []
        currentPattern.removeAll()
        
        for _ in 1...currentLevel {
            currentPattern.append(Int.random(in: 0 ..< 4))
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
    }
    
    
        
        
        
        
    @objc func onTimerFires(){
        
        let colors = [redButton, greenButton, blueButton, yellowButton]
        
        if currentIndex == currentPattern.count {
            timer.invalidate()
            view.isUserInteractionEnabled = true
            GameInstructions.text = "Repeat Pattern"
            
        }else{
            view.isUserInteractionEnabled = false
            GameInstructions.text = "Watch Pattern"
            colors[currentPattern[currentIndex]]?.flash()
            currentIndex += 1
        }
        
        
        
    }
    
    func verifyPattern() {
        if userPattern.count > currentPattern.count || userPattern[userIndex] != currentPattern[userIndex] {
            GameInstructions.text = "You lose!"
            NextLevel.titleLabel!.text = "Play Again"
            greenButton.isUserInteractionEnabled = false
            redButton.isUserInteractionEnabled = false
            blueButton.isUserInteractionEnabled = false
            yellowButton.isUserInteractionEnabled = false
            NextLevel.isUserInteractionEnabled = true
            userPattern = []
            currentLevel = 0
        }else {
            if userIndex == currentPattern.count - 1 {
                NextLevel.isUserInteractionEnabled = true
            }
            userIndex += 1
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenButton.isUserInteractionEnabled = false
        redButton.isUserInteractionEnabled = false
        blueButton.isUserInteractionEnabled = false
        yellowButton.isUserInteractionEnabled = false
    }


}

