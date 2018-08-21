//
//  ViewController.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Mark: Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view, typically from a nib.
//        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        label.text = textField.text
    }

    func handleClientError(_ error: Error) {
        print(error)
    }


    
    // Mark: Actions
    @IBAction func action(_ sender: UIButton) {
//        label.text = "Default Text Field"
    }
    
    @IBAction func callServer(_ sender: UIButton) {
    }
    
    
}

