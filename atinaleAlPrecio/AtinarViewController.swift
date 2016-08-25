//
//  AtinarViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/8/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class AtinarViewController: UIViewController {
    
    @IBOutlet weak var Participante1: UITextField!
    @IBOutlet weak var Participante2: UITextField!
    @IBOutlet weak var Participante3: UITextField!
    @IBOutlet weak var precio: UITextField!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var a = 0.0
    var contadorRound = 0
    
    
    override func viewDidLoad() {
        configureBackground()
        
        Participante1.text = ("00.00")
        Participante2.text = ("00.00")
        Participante3.text = ("00.00")
    }
    
    override func viewWillAppear(animated: Bool) {
        Participante1.text = ("00.00")
        Participante2.text = ("00.00")
        Participante3.text = ("00.00")
        Participante1.textColor = UIColor.blackColor()
        Participante2.textColor = UIColor.blackColor()
        Participante3.textColor = UIColor.blackColor()
        precio.font = precio.font?.fontWithSize(45)
        precio.text = ("Atínale al precio")
        
        contadorRound += 1
        roundLabel.text = "Round: " + "\(contadorRound)"
    }
    
    func roundNumber(numero: Int) -> Double{
        var z: Double
        
        if numero == 1 {
            z = constants.atinar.precio1
        } else if numero == 2 {
            z = constants.atinar.precio2
        } else if numero == 3{
            z = constants.atinar.precio3
        } else if numero == 4{
            z = constants.atinar.precio4
        } else {
            z = 100
        }
        
        print(z)
        return z
    }
    
    @IBAction func revelarPrecio(sender: AnyObject) {
        a = roundNumber(contadorRound)
        verify()
     }
    
    func verify() {
        let b:Double = Double(Participante1.text!)!
        let c:Double = Double(Participante2.text!)!
        let d:Double = Double(Participante3.text!)!

        let e = abs(a - b)
        let f = abs(a - c)
        let g = abs(a - d)
        
        if ((b > a) && (c > a) && (d > a)){
            Participante1.text = ("🙄")
            Participante2.text = ("🙄")
            Participante3.text = ("🙄")
            
            let alertController = UIAlertController(title: "🤔", message:
                "Todos se pasaron", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Reintentar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if ((e == f) && (e == g) && (g == f))  {
            Participante1.text = ("🤔")
            Participante2.text = ("🤔")
            Participante3.text = ("🤔")
        }
        else if (e < f) && (e < g) && (b <= a) || (b <= a) && (c > a) && (d > a) || (e < g) && (c > a) || (e < f) && (d > a){
                Participante1.text = ("Ganador: " + "\(b)" + "0" )
                Participante1.textColor = UIColor.orangeColor()
            precio.text = ("$" + "\(a)"+"0")
            precio.font = precio.font?.fontWithSize(100)

                } else if (f < e) && (f < g) && (c <= a) || (b > a) && (c <= a) && (d > a) || (f < e) && (d > a) || (f < g) && (b > a){
                    Participante2.text = ("Ganador: " + "\(c)" + "0" )
                    Participante2.textColor = UIColor.orangeColor()
            precio.text = ("$" + "\(a)"+"0")
            precio.font = precio.font?.fontWithSize(100)

                    } else if (g < e) && (g < f) && (d <= a) || (b > a) && (c > a) && (d <= a) || (g < f) && (b > a) || (g < e) && (c > a) {
                        Participante3.text = ("Ganador: " + "\(d)" + "0")
                        Participante3.textColor = UIColor.orangeColor()
            precio.text = ("$" + "\(a)"+"0")
            precio.font = precio.font?.fontWithSize(100)

                    }
        
      //  print(e, f, g)
        
    }
}

extension AtinarViewController {
    
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
