//
//  gamesMenuViewController.swift
//  atinaleAlPrecio
//
//  Created by Salvador De La Rosa on 8/26/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import Foundation
import UIKit

class gamesMenuViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
    }
    
    
}

extension gamesMenuViewController {
    
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
