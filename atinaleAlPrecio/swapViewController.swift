//
//  swapViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/22/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class swapViewController: UIViewController {
    
   
    @IBOutlet weak var producto1: UIImageView!
    @IBOutlet weak var producto2: UIImageView!
    @IBOutlet weak var precio1: UILabel!
    @IBOutlet weak var precio2: UILabel!
    @IBOutlet weak var precioCambiado1: UILabel!
    @IBOutlet weak var precioCambiado2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        precio1.text = "$" + "\(constants.swap.precioOne)" + ".00"
        precio2.text = "$" + "\(constants.swap.precioTwo)" + ".00"
        precioCambiado1.hidden = true
        precioCambiado2.hidden = true
    }
    
    
    
    @IBAction func cambiar(sender: AnyObject) {
        precioCambiado1.hidden = false
        precioCambiado2.hidden = false
        precioCambiado1.text = "$" + "\(constants.swap.precioTwo)" + ".00"
        precioCambiado2.text = "$" + "\(constants.swap.precioOne)" + ".00"
        
    }
    
    func evaluar() -> Bool{
        if constants.swap.precioOne == constants.swap.rightAnswerOne || constants.swap.precioTwo == constants.swap.rightAnswerTwo {
            return true
        } else if constants.swap.precioOne == constants.swap.rightAnswerTwo || constants.swap.precioTwo == constants.swap.rightAnswerOne {
            return false
        } else {
            return false
        }
        
        
        
    }
    
    
    func action(x: Bool)  {
        if x == true{
            precioCambiado1.text = "Correcto 😬"
            precioCambiado2.text = "Coreccto 😬"
        } else {
            precioCambiado1.text = "Incorrecto ☹️"
            precioCambiado2.text = "Incorrecto ☹️"
        }
    }

    @IBAction func revelar(sender: AnyObject) {
        let answer = evaluar()
        action(answer)

    }
    
    
}