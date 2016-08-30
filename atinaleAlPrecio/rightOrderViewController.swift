//
//  rightOrderViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/17/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class rightOrderViewController: UIViewController {
    
    @IBOutlet weak var price1: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var price3: UILabel!
    @IBOutlet weak var userAnswer1: UITextField!
    @IBOutlet weak var userAnswer2: UITextField!
    @IBOutlet weak var userAnswer3: UITextField!
    @IBOutlet weak var firstAnswerVerifier: UILabel!
    @IBOutlet weak var secondAnswerVerifier: UILabel!
    @IBOutlet weak var thirdAnswerVerifier: UILabel!
    @IBOutlet weak var revelarBoton: UIButton!
    
    var priceOne = constants.rightOrder.price1
    var priceTwo = constants.rightOrder.price2
    var priceThree = constants.rightOrder.price3
    
    var rightAnswer1 = constants.rightOrder.rightAnswerOne
    var rightAnswer2 = constants.rightOrder.rightAnswerTwo
    var rightAnswer3 = constants.rightOrder.rightAnswerThree
    var d:Bool = false
    var e:Bool = false
    var f:Bool = false
    var flag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        
        price1.text = priceOne
        price2.text = priceTwo
        price3.text = priceThree
        
        revelarBoton.layer.cornerRadius = 5
    }

    @IBAction func respuesta(sender: AnyObject) {
        
        flag += 1
        
        let a:Int = Int(userAnswer1.text!)!
        let b:Int = Int(userAnswer2.text!)!
        let c:Int = Int(userAnswer3.text!)!
        
        if rightAnswer1 == a {
            d = true
        }

        if rightAnswer2 == b {
            e = true
        }

        if rightAnswer3 == c {
            f = true
        }
        
        print(d, e, f)
        
        compare()
    }
    
    func compare() {
        if flag < 3 {
            
            if d == true || e == true || f == true {
                firstAnswerVerifier.text = "🏆"
            }
            if d == true && e == true || d == true && f == true || e == true && f == true {
                firstAnswerVerifier.text = "🏆"
                secondAnswerVerifier.text = "🏆"
            }
            if d == true && e == true && f == true {
                firstAnswerVerifier.text = "🏆"
                secondAnswerVerifier.text = "🏆"
                thirdAnswerVerifier.text = "🏆"
                
                userAnswer1.userInteractionEnabled = false
                userAnswer2.userInteractionEnabled = false
                userAnswer3.userInteractionEnabled = false
            }
            

            
        } else{
            firstAnswerVerifier.text = "❌"
            secondAnswerVerifier.text = "❌"
            thirdAnswerVerifier.text = "❌"
        }
    }
}

//Configure UI
extension rightOrderViewController {
    
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
