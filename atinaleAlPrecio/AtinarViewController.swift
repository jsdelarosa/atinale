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
    
    var a = 150
    
    
    override func viewDidLoad() {
        Participante1.text = ("00.00")
        Participante2.text = ("00.00")
        Participante3.text = ("00.00")
    }
    
    @IBAction func revelarPrecio(sender: AnyObject) {
        precio.text = ("$" + "\(a)" + ".00")
       // print("$","\(a)",".00")
        precio.font = precio.font?.fontWithSize(100)
        
        correct()
     }
    
    func correct() {
        let b:Int = Int(Participante1.text!)!
        let c:Int = Int(Participante2.text!)!
        let d:Int = Int(Participante3.text!)!

        let e = abs(a - b)
        let f = abs(a - c)
        let g = abs(a - d)
        
            if (e < f) && (e < g) && (b <= a) || (b <= a) && (c > a) && (d > a) || (e < g) && (c > a) || (e < f) && (d > a){
                Participante1.text = ("Respuesta Correcta: " + "\(b)" )
                Participante1.textColor = UIColor.orangeColor()
                } else if (f < e) && (f < g) && (c <= a) || (b > a) && (c <= a) && (d > a) || (f < e) && (d > a) || (f < g) && (b > a){
                    Participante2.text = ("Respuesta Correcta: " + "\(c)" )
                    Participante2.textColor = UIColor.orangeColor()
                    } else if (g < e) && (g < f) && (d <= a) || (b > a) && (c > a) && (d <= a) || (g < f) && (b > a) || (g < e) && (c > a) {
                        Participante3.text = ("Respuesta Correcta: " + "\(d)" )
                        Participante3.textColor = UIColor.orangeColor()
                    }
        
        print(e, f, g)

        if ((b > a) && (c > a) && (d > a)){
            Participante1.text = ("X")
            Participante2.text = ("X")
            Participante3.text = ("X")
        }
    }
    
    
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as!NSValue
        return keyboardSize.CGRectValue().height
    }
    
    //Moves the view when the kb covers the text field
    func keyboardWillShow(notification: NSNotification) {
        if Participante3.isFirstResponder() {
            view.frame.origin.y = getKeyboardHeight(notification) * (-1)
        }
    }
    
    //Returns the view when keyboard dismisses
    func keyboardWillHide(notification: NSNotification) {
        if Participante3.isFirstResponder() {
            view.frame.origin.y = 0
        }
    }
    
    //Subscribe & Unsubscribe from Keyboard Notifications
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    
    func subsbscribeToKeyboardHideNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardHideNotification() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
}
