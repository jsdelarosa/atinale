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
    
    var currentCount = 0.0
    let maxCount = 61.0
    var count = 60
    var articulos = 3
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contarArticulos.text = String(articulos)
        circularProgressView.angle = 0
    }
    
    @IBAction func iniciar(sender: AnyObject) {
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("update"), userInfo: nil, repeats: true)
    }
    
    @IBAction func Disminuir(sender: AnyObject) {
        articulos -= 1
        contarArticulos.text = String(articulos)
        
        if articulos == 0 {
        flag = 1
        contarArticulos.text = "Ganador"
        contarArticulos.font = contarArticulos.font?.fontWithSize(50)
        contarArticulos.textColor = UIColor.redColor()
        }
        
        if articulos < 0 {
            contarArticulos.text = "Ganador"
        }
    }

    func update() {
        if count >= 0 && flag != 1 {
            countDownLabel.text =  ("\(count)" + " segundos")
            count -= 1
            
        if count <= 9 {
            countDownLabel.textColor = UIColor.redColor()
            countDownLabel.font = countDownLabel.font?.fontWithSize(100)
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
