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
    @IBOutlet weak var botonCambiar: UIButton!
    @IBOutlet weak var botonRevelar: UIButton!
    
    var flag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        
        precio1.text = "$" + "\(constants.swap.precioOne)" + ".00"
        precio2.text = "$" + "\(constants.swap.precioTwo)" + ".00"
        precioCambiado1.hidden = true
        precioCambiado2.hidden = true
        
        botonCambiar.layer.cornerRadius = 5
        botonRevelar.layer.cornerRadius = 5
    }
    
    
    
    @IBAction func cambiar(sender: AnyObject) {
        precioCambiado1.hidden = false
        precioCambiado2.hidden = false
        precioCambiado1.text = "$" + "\(constants.swap.precioTwo)" + ".00"
        precioCambiado2.text = "$" + "\(constants.swap.precioOne)" + ".00"
        
        flag = 1
    }
    
    

    @IBAction func revelar(sender: AnyObject) {
        
        if flag == 0 {
            
            print(constants.swap.precioOne, constants.swap.rightAnswerOne)
            precioCambiado1.hidden = false
            precioCambiado2.hidden = false
            
            if (constants.swap.precioOne == constants.swap.rightAnswerOne && constants.swap.precioTwo == constants.swap.rightAnswerTwo) {
                precioCambiado1.text = "Correcto 😁"
                precioCambiado2.text = "Correcto 😁"
            } else {
                precioCambiado1.text = "Incorrecto ☹️"
                precioCambiado2.text = "Incorrecto ☹️"
            }
        }
        
        else {
            if (constants.swap.precioOne == constants.swap.rightAnswerTwo && constants.swap.precioTwo == constants.swap.rightAnswerOne) {
                precio1.text = "Correcto 😁"
                precio2.text = "Correcto 😁"
            } else {
                precio1.text = "Incorrecto ☹️"
                precio2.text = "Incorrecto ☹️"
            }
        }
    }
}

//Configure UI
extension swapViewController {
    
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