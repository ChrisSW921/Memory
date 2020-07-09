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
    
    var currentLevel: Int = 0
    var highScore: Int = 0
    var currentPattern: [Int] = []
    var currentIndex: Int = 0
    
    
    var timer = Timer()
    
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        print("Red")
        newLevel()
        
    }
    
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        print("green")
        sender.flash()
    }
    
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        print("blue")
        sender.flash()
    }
    
    
    @IBAction func yellowButtonPressed(_ sender: UIButton) {
        print("yellow")
        sender.flash()
    }
    
    
    func newLevel() {
        timer.invalidate()
        currentLevel += 1
        currentIndex = 0
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
        }else{
            colors[currentPattern[currentIndex]]?.flash()
            currentIndex += 1
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

