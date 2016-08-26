//
//  moreOrLessViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/22/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class moreOrLessViewController: UIViewController {
    
    @IBOutlet weak var precio1: UILabel!
    @IBOutlet weak var precio2: UILabel!
    @IBOutlet weak var precio3: UILabel!
    @IBOutlet weak var menos2: UIButton!
    @IBOutlet weak var mas1: UIButton!
    @IBOutlet weak var menos1: UIButton!
    @IBOutlet weak var mas2: UIButton!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var mas3: UIButton!
    @IBOutlet weak var menos3: UIButton!
    
    var precioReal1 = constants.moreOrLess.real1
    var precioReal2 = constants.moreOrLess.real2
    var precioReal3 = constants.moreOrLess.real3
    var precioEtiqueta1 = constants.moreOrLess.etiqueta1
    var precioEtiqueta2 = constants.moreOrLess.etiqueta2
    var precioEtiqueta3 = constants.moreOrLess.etiqueta3

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        mas1.layer.cornerRadius = 5
        mas2.layer.cornerRadius = 5
        mas3.layer.cornerRadius = 5
        menos1.layer.cornerRadius = 5
        menos2.layer.cornerRadius = 5
        menos3.layer.cornerRadius = 5
        
        precio1.text = "$" + String(precioEtiqueta1) + ".00"
        precio2.text = "$" + String(precioEtiqueta2) + ".00"
        precio3.text = "$" + String(precioEtiqueta3) + ".00"
        mas2.hidden = true
        menos2.hidden = true
        mas3.hidden = true
        menos3.hidden = true
        status.text = "😎"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        status.center.y -= view.bounds.width
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2, delay: 0.5, options: [], animations: {
            self.status.center.x += self.view.bounds.width
            }, completion: nil)
    }
    
    func revelar(result: Bool, text: Int, precioReal: Int) -> Int {
        
        var resultado: Int
        
        if result == true && precioReal > text
        {
            print("Correct")
            resultado = 0
            return resultado
        } else if result == false && precioReal < text {
            print("Correct")
            resultado = 0
            return resultado
        } else {
            print("Incorrect")
            resultado = 1
            return resultado
        }
        
    }

    
    @IBAction func mas1(sender: AnyObject) {
        let etiqueta = revelar(true, text: precioEtiqueta1, precioReal: precioReal1)
        
        if etiqueta == 0 {
            mas2.hidden = false
            menos2.hidden = false
        } else {
            status.text = "☹️"
        }
    }
    
    @IBAction func menos1(sender: AnyObject) {
        let etiqueta = revelar(false, text: precioEtiqueta1, precioReal: precioReal1)
        if etiqueta == 0 {
            mas2.hidden = false
            menos2.hidden = false
        } else {
            status.text = "☹️"
        }
    }
    
    @IBAction func mas2(sender: AnyObject) {
        let etiqueta1 = revelar(true, text: precioEtiqueta2, precioReal: precioReal2)
        if etiqueta1 == 0 {
            mas3.hidden = false
            menos3.hidden = false
        } else {
            status.text = "☹️"
        }
    }
    
    @IBAction func menos2(sender: AnyObject) {
        let etiqueta1 = revelar(false, text: precioEtiqueta2, precioReal: precioReal2)
        if etiqueta1 == 0 {
            mas3.hidden = false
            menos3.hidden = false
        } else {
            status.text = "☹️"
        }
            
    }
    
    @IBAction func mas3(sender: AnyObject) {
         let etiqueta2 = revelar(true, text: precioEtiqueta3, precioReal: precioReal3)
        if etiqueta2 == 1 {
            status.text = "☹️"
        }
    }

    @IBAction func menos3(sender: AnyObject) {
         let etiqueta2 = revelar(false, text: precioEtiqueta3, precioReal: precioReal3)
        if etiqueta2 == 1 {
            status.text = "☹️"
        }
    }
}


extension moreOrLessViewController {
    
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
