//
//  pathFinderViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/27/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class pathFinderViewController: UIViewController {
    
// $7490
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var strikesCounter: UILabel!
    @IBOutlet weak var strikesLabel: UILabel!
    @IBOutlet weak var correct1: UIButton!
    @IBOutlet weak var correct2: UIButton!
    @IBOutlet weak var correct3: UIButton!
    @IBOutlet weak var wrong1: UIButton!
    @IBOutlet weak var wrong2: UIButton!
    @IBOutlet weak var wrong3: UIButton!
    @IBOutlet weak var wrong4: UIButton!
    @IBOutlet weak var wrong5: UIButton!
    @IBOutlet weak var wrong6: UIButton!
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var tres3: UIButton!
    
    var strike = 0
    var flag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        
        label1.text = "$"
        label2.text = "7"
        strikesCounter.hidden = true
        strikesLabel.hidden = true
        state.hidden = true
    }
    
    
    //CORRECTO
    
    @IBAction func accion1(sender: AnyObject) {
        flag += 1
        correcto()
        correct1.backgroundColor = UIColor.blackColor()
    }
    
    @IBAction func accion2(sender: AnyObject) {
        flag += 1
        correcto()
        correct2.backgroundColor = UIColor.blackColor()
    }

    @IBAction func accion3(sender: AnyObject) {
        flag += 1
        correcto()
        state.hidden = false
        correct3.backgroundColor = UIColor.blackColor()
        state.text = "Ganador 😬"
    }
    
    func correcto() {
        if flag == 1 {
            label3.text = "4"
        } else if flag == 2 {
            label4.text = "9"
        } else if flag == 3 {
            label5.text = "0"
            
        }
        else {
            print("warning")
        }
    }
    
    
    //INCORRECTO
    
    @IBAction func incorrectAction(sender: AnyObject) {
        strike += 1
        incorrect()
        wrong6.setTitle("X", forState: UIControlState.Normal)
        
    }

    @IBAction func incorrectAction3(sender: AnyObject) {
         strike += 1
        incorrect()
        wrong4.setTitle("X", forState: UIControlState.Normal)
    }
    
    @IBAction func incorrectAction4(sender: AnyObject) {
         strike += 1
        incorrect()
        wrong5.setTitle("X", forState: UIControlState.Normal)
    }
    
    @IBAction func incorrectAction5(sender: AnyObject) {
         strike += 1
        incorrect()
        wrong3.setTitle("X", forState: UIControlState.Normal)
    }
    
    @IBAction func incorrectAction6(sender: AnyObject) {
         strike += 1
        incorrect()
        wrong2.setTitle("X", forState: UIControlState.Normal)
    }
    
    @IBAction func incorrectAction7(sender: AnyObject) {
         strike += 1
        incorrect()
        wrong1.setTitle("X", forState: UIControlState.Normal)
    }
    
    func incorrect() {
        
        strikesCounter.hidden = false
        strikesLabel.hidden = false
        
        if strike == 1 {
            strikesCounter.text = "❌"
        } else if strike == 2{
            strikesCounter.text = "❌❌"
        } else if strike == 3 {
            strikesCounter.text = "❌❌❌"
            state.hidden = false
            state.text = "Game Over ☹️"
        } else {
            print("Warning")
        }
    }
    
}

//Configure UI
extension pathFinderViewController {
    
    private func configureBackground() {
        let backgroundGradient = CAGradientLayer()
        let colorTop = UIColor(red: 0.345, green: 0.839, blue: 0.988, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 0.023, green: 0.569, blue: 0.910, alpha: 1.0).CGColor
        backgroundGradient.colors = [colorTop, colorBottom]
        backgroundGradient.locations = [0.0, 1.0]
        backgroundGradient.frame = view.frame
        view.layer.insertSublayer(backgroundGradient, atIndex: 0)
    }
}