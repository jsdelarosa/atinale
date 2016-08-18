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
    
    var priceOne = "$19.00"
    var priceTwo = "$50.00"
    var priceThree = "$100.00"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        price1.text = priceOne
        price2.text = priceTwo
        price3.text = priceThree
        
        rightAnswer1.text = "a"
        rightAnswer2.text = "b"
        rightAnswer3.text = "c"
        
        userAnswer2.hidden = true
        userAnswer3.hidden = true
    }

    @IBAction func respuesta(sender: AnyObject) {
        revisar()
    }
 
    func revisar() {
        if userAnswer1 == rightAnswer1 {
            userAnswer1.text = "\(userAnswer1)" + " Correcto"
            userAnswer2.hidden = false
            print(rightAnswer1)
            print(userAnswer1)
        } else {
            userAnswer1.text = "\(userAnswer1)" + " Incorrecto"
            print(rightAnswer1, "incorrecto")
            print(userAnswer1)
        }
    }
    
}
