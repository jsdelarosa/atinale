//
//  cronometro.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/16/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class cronometro: UIViewController {
    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var contarArticulos: UILabel!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var botonIniciar: UIButton!
    @IBOutlet weak var botonCorrecto: UIButton!
    
    var currentCount = 0.0
    let maxCount = 61.0
    var count = 60
    var articulos = 3
    var flag = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        contarArticulos.text = String(articulos)
        circularProgressView.angle = 0
        
        botonIniciar.layer.cornerRadius = 5
        botonCorrecto.layer.cornerRadius = 5
        
        countDownLabel.font = UIFont(name: "Rollmops", size: 90)
        contarArticulos.font = UIFont(name: "Rollmops", size: 70)
    }
    
    @IBAction func iniciar(sender: AnyObject) {
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("update"), userInfo: nil, repeats: true)
    }
    
    @IBAction func Disminuir(sender: AnyObject) {
        articulos -= 1
        contarArticulos.text = String(articulos)
        
        if articulos == 0 || articulos < 0 {
        flag = 1
        contarArticulos.text = "Ganador"
        contarArticulos.font = contarArticulos.font?.fontWithSize(50)
        contarArticulos.textColor = UIColor.whiteColor()
        }
    }

    func update() {
        if count >= 0 && flag != 1 {
            countDownLabel.text =  ("\(count)")
            count -= 1
            
        if count <= 9 {
            countDownLabel.textColor = UIColor.init(colorLiteralRed: 0.55, green: 0.00, blue: 0.49, alpha: 1.0)
        }
            
            if currentCount != maxCount {
                currentCount += 1
                let newAngleValue = newAngle()
                
                circularProgressView.animateToAngle(newAngleValue, duration: 0.5, completion: nil)
            }
        }
        
        

    }
    
    func newAngle() -> Int {
        return Int(360 * (currentCount / maxCount))
    }
    
}


//Configure UI
extension cronometro {
    
    private func setUIEnabled(enabled: Bool) {
        botonIniciar.enabled = enabled
        
        // adjust login button alpha
        if enabled {
            botonIniciar.alpha = 1.0
        } else {
            botonIniciar.alpha = 0.5
        }
    }
    
    
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
