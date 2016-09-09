//
//  ViewController.swift
//  PopDatePickerApp
//
//  Created by Valerio Ferrucci on 07/10/14.
//  Copyright (c) 2014 Valerio Ferrucci. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var popDatePicker : PopDatePicker?
    
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popDatePicker = PopDatePicker(forTextField: dobTextField)
        dobTextField.delegate = self
        
    }
    
    func resign() {
        
        dobTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    
    if (textField === dobTextField) {
        resign()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let initDate : Date? = formatter.date(from: dobTextField.text!)
        
        let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : Date, forTextField : UITextField) -> () in
            
            // here we don't use self (no retain cycle)
            forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
            
        }
        
        popDatePicker!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
        return false
    }
    else {
        return true
    }
}
    
    @IBAction func save(_ sender: AnyObject) {
        
        var msg : String
        if nameTextField.text != "" && dobTextField.text != "" {
            msg = nameTextField.text! + " " + dobTextField.text!
        } else {
            msg = "Name or Date empty!"
        }
        let alert:UIAlertController = UIAlertController(title: title, message: msg, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
            
        }))
        self.present(alert, animated:true, completion:nil);
        
    }
}

