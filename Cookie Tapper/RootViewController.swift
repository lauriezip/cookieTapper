//
//  RootViewController.swift
//  Cookie Tapper
//
//  Created by E on 9/26/17.
//  Copyright © 2017 Codebase. All rights reserved.
//

import UIKit

extension UIButton {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}

class RootViewController: UIViewController {
    
    @IBOutlet weak var cookieMove: UIImageView!
    
    @IBOutlet weak var tapCounterLabel: UILabel!
    @IBOutlet weak var tapGoalLabel: UILabel!
    
    var currentTapCount = 0
    var isTapping = false
    let tapGoal = 10
    
    var goalIsMet: Bool {
        return currentTapCount >= tapGoal
    }
    
    var tapOrTaps: String {
        
        if currentTapCount != 1 {
            return "Taps"
        } else{
        return "Tap"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTapLabel()
        tapGoalLabel.text = "Goal: \(tapGoal)"
    }
    
    @IBAction func shake(_ sender: UIButton) {
        if !goalIsMet {
        sender.shake()
        }
    }

    @IBAction func onResetPressed(_ sender: Any) {
        currentTapCount = 0
        updateTapLabel()
    }
    
    @IBAction func onCookieTapped(_ sender: Any) {
        if !goalIsMet {
            isTapping = true
            incrementTapCount()
            updateTapLabel()
        }
       //  cookieMove.transform = CGAffineTransform(rotationAngle: (15.0))
       //  cookieMove.transform = CGAffineTransform(rotationAngle: (-15.0))
       //  cookieMove.transform = CGAffineTransform(rotationAngle: (0.0))
    }
    
    func incrementTapCount() {
        currentTapCount += 1
        if goalIsMet {
            isTapping = false
        }
    }
    
    func updateTapLabel() {
        
        tapCounterLabel.text = "\(currentTapCount) " + tapOrTaps
        if isTapping {
            tapCounterLabel.textColor = UIColor.blue
            
        } else {
            tapCounterLabel.textColor = UIColor.black
        }
    }
}

