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
    
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        print("Red")
        sender.flash()
        
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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

