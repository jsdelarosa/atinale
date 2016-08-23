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
        price1.text = priceOne
        price2.text = priceTwo
        price3.text = priceThree
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
        if flag <= 2 {
            
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
            }
        } else{
            firstAnswerVerifier.text = "❌"
            secondAnswerVerifier.text = "❌"
            thirdAnswerVerifier.text = "❌"
        }
        
    }

}
