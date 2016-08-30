//
//  revoltijoViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/29/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

//$4990

class revoltijoViewController: UIViewController {
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var answer4: UITextField!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option5: UIButton!
    @IBOutlet weak var status: UILabel!
    
    var flag = 0
    var strike = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        
        option1.layer.cornerRadius = 5
        option2.layer.cornerRadius = 5
        option3.layer.cornerRadius = 5
        option4.layer.cornerRadius = 5
        option5.layer.cornerRadius = 5
        
        option1.setTitle(constants.revoltijo.cifra1, forState: UIControlState.Normal)
        option2.setTitle(constants.revoltijo.cifra2, forState: UIControlState.Normal)
        option3.setTitle(constants.revoltijo.cifra3, forState: UIControlState.Normal)
        option4.setTitle(constants.revoltijo.cifra4, forState: UIControlState.Normal)
        option5.setTitle(constants.revoltijo.cifra5, forState: UIControlState.Normal)
        
        status.hidden = true
    }
    
    @IBAction func firstSelector(sender: AnyObject) {
        var a = select(constants.revoltijo.cifra1, bandera: flag)
       // print(flag)
    }
    
    @IBAction func secondSelector(sender: AnyObject) {
        var a = select(constants.revoltijo.cifra2, bandera: flag)
        //print(flag)
    }
    
    @IBAction func thirdSelector(sender: AnyObject) {
        var a = select(constants.revoltijo.cifra3, bandera: flag)
        //print(flag)
    }
    
    @IBAction func fourthSelector(sender: AnyObject) {
        var a = select(constants.revoltijo.cifra4, bandera: flag)
        //print(flag)
    }
    
    @IBAction func fifthSelector(sender: AnyObject) {
        var a = select(constants.revoltijo.cifra5, bandera: flag)
        //print(flag)
    }

    func select(letra: String, bandera: Int) -> Int {

        if bandera == 0 {
            if letra == constants.revoltijo.cifraCorrecta1 {
                answer1.text = constants.revoltijo.cifraCorrecta1
                flag += 1
                print(constants.revoltijo.cifraCorrecta1)
                return flag
            } else {
                print("Cifra 1 incorrecta")
            }
        }
            
        else if bandera == 1 {
            if letra == constants.revoltijo.cifraCorrecta2 {
                answer2.text = constants.revoltijo.cifraCorrecta2
                flag += 1
                print(constants.revoltijo.cifraCorrecta2)
                return flag
            } else {
                print("Cifra 2 incorrecta")
                }
            }
        else if bandera == 2 {
            if letra == constants.revoltijo.cifraCorrecta3 {
                answer3.text = constants.revoltijo.cifraCorrecta3
                flag += 1
                print(constants.revoltijo.cifraCorrecta3)
                return flag
            } else {
                print("Cifra 3 incorrecta")
            }
        }
        else if bandera == 3 {
            if letra == constants.revoltijo.cifraCorrecta4 {
                answer4.text = constants.revoltijo.cifraCorrecta4
                flag += 1
                print(constants.revoltijo.cifraCorrecta4)
                status.hidden = false
                status.text = "Ganador 😬"
                return flag
            } else {
                print("Cifra 4 incorrecta")
            }
        }
            
        else {
            print("warning")
            }
        
      return 100
    }
}

//Configure UI
extension revoltijoViewController {
    
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