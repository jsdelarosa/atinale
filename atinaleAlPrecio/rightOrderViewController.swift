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
    @IBOutlet weak var rightAnswer1: UITextField!
    @IBOutlet weak var rightAnswer2: UITextField!
    @IBOutlet weak var rightAnswer3: UITextField!
    @IBOutlet weak var firstAnswerVerifier: UILabel!
    @IBOutlet weak var secondAnswerVerifier: UILabel!
    @IBOutlet weak var thirdAnswerVerifier: UILabel!
    
    var priceOne = "$19.00"
    var priceTwo = "$50.00"
    var priceThree = "$100.00"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        price1.text = priceOne
        price2.text = priceTwo
        price3.text = priceThree
        
        rightAnswer1.text = "1"
        rightAnswer2.text = "2"
        rightAnswer3.text = "3"
        
        userAnswer2.hidden = true
        userAnswer3.hidden = true
    }

    @IBAction func respuesta(sender: AnyObject) {
        
        rightAnswer1.backgroundColor = UIColor.whiteColor()
        
        let a:Int = Int(rightAnswer1.text!)!
        let b:Int = Int(userAnswer1.text!)!
        
        if a == b {
            userAnswer2.hidden = false

        }
    }

    @IBAction func respuesta2(sender: AnyObject) {
        rightAnswer2.backgroundColor = UIColor.whiteColor()
        
        let c:Int = Int(rightAnswer2.text!)!
        let d:Int = Int(userAnswer2.text!)!
        
        if c == d {
            userAnswer3.hidden = false

            
        }
    }
    
    @IBAction func respuesta3(sender: AnyObject) {
        rightAnswer3.backgroundColor = UIColor.whiteColor()
        
        let e:Int = Int(rightAnswer3.text!)!
        let f:Int = Int(userAnswer3.text!)!
        
        if e == f {

        }
        
    }
    
    
}
