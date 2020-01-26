//
//  ViewController.swift
//  TimerApp
//
//  Created by Muhammad Shams on 26/01/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterText: UILabel!
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var pause: UIButton!
    
    var timer = Timer()
    var count = 0.0
    var isRunning=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterText.text =  "\(count)"
        play.isEnabled = true
        pause.isEnabled = false
    }

    @IBAction func pause(_ sender: Any) {
           play.isEnabled = true
           pause.isEnabled = false
        
        timer.invalidate()
        isRunning = false
    
    }
    
    @IBAction func reset(_ sender: Any) {
            timer.invalidate()
            count = 0
            play.isEnabled = true
            pause.isEnabled = false
            counterText.text =  "\(count)"
            isRunning = false
    
    }
    
    @IBAction func play(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(funUpdateTimer), userInfo: nil, repeats: true)
        
        play.isEnabled = false
        pause.isEnabled = true
        
        isRunning = true
    }
    
    
    @objc func funUpdateTimer(){
        count += 0.1
        counterText.text = String(format: "%.1f", count)
        
    }
    
}

