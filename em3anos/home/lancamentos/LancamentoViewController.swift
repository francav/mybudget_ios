//
//  LancamentoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 23/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var periodoPicker: UIPickerView!
    
    var periodos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        periodos = ["08/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018", "09/2018"]
        
        periodoPicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return periodos.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//            return contas[row].nome
        return periodos[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            txtConta.text = contas[row].nome
//            selectedConta = contas[row]
    }

}
