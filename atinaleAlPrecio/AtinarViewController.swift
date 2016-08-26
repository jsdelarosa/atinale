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
    @IBOutlet weak var BotonNext: UIButton!
    
    var a = 0.0
    var contadorRound = 0
    
    override func viewDidLoad() {
        configureBackground()
        BotonNext.hidden = true
        BotonNext.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(animated: Bool) {
        Participante1.center.x -= view.bounds.width
        Participante2.center.x -= view.bounds.width
        Participante3.center.x -= view.bounds.width
        
        Participante1.text = ("00.00")
        Participante2.text = ("00.00")
        Participante3.text = ("00.00")
        
        Participante1.textColor = UIColor.blackColor()
        Participante2.textColor = UIColor.blackColor()
        Participante3.textColor = UIColor.blackColor()
        precio.font = precio.font?.fontWithSize(45)
        precio.text = ("Atínale al precio")
        
        contadorRound += 1
        roundLabel.text = "\(contadorRound)"
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, delay: 0.4,
        options: [], animations: {
            self.Participante1.center.x += self.view.bounds.width}
        , completion: nil)
        
        UIView.animateWithDuration(1.5, delay: 0.3, options: [], animations: {
            self.Participante2.center.x += self.view.bounds.width}
        , completion: nil)
        
        UIView.animateWithDuration(2, delay: 0.2, options: [], animations: {
            self.Participante3.center.x += self.view.bounds.width}
        , completion: nil)
        
        
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
                Participante1.text = ("\(b)" + "0" + " Ganador")
                Participante1.textColor = UIColor.init(colorLiteralRed: 0.55, green: 0.00, blue: 0.49, alpha: 1.0)
            precio.text = ("$" + "\(a)"+"0")
            precio.font = precio.font?.fontWithSize(100)
            BotonNext.hidden = false

                } else if (f < e) && (f < g) && (c <= a) || (b > a) && (c <= a) && (d > a) || (f < e) && (d > a) || (f < g) && (b > a){
                    Participante2.text = ("\(c)" + "0" + " Ganador")
                    Participante2.textColor = UIColor.init(colorLiteralRed: 0.55, green: 0.00, blue: 0.49, alpha: 1.0)
            precio.text = ("$" + "\(a)"+"0")
            precio.font = precio.font?.fontWithSize(100)
            BotonNext.hidden = false
            
                    } else if (g < e) && (g < f) && (d <= a) || (b > a) && (c > a) && (d <= a) || (g < f) && (b > a) || (g < e) && (c > a) {
                        Participante3.text = ("\(d)" + "0" + " Ganador")
                        Participante3.textColor = UIColor.init(colorLiteralRed: 0.55, green: 0.00, blue: 0.49, alpha: 1.0)
            precio.text = ("$" + "\(a)"+"0")
            precio.font = precio.font?.fontWithSize(100)
            BotonNext.hidden = false

                    }
        
        print(e, f, g)
        
    }
}

extension AtinarViewController {
    
    private func configureBackground() {
        let backgroundGradient = CAGradientLayer()
        let colorTop = UIColor(red: 0.96, green: 0.00, blue: 0.35, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 0.55, green: 0.00, blue: 0.49, alpha: 1.0).CGColor
        backgroundGradient.colors = [colorTop, colorBottom]
        backgroundGradient.locations = [0.0, 1.0]
        backgroundGradient.frame = view.frame
        view.layer.insertSublayer(backgroundGradient, atIndex: 0)
    }
}
