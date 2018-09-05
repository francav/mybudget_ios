//
//  LancamentoValorFormViewController.swift
//  em3anos
//
//  Created by Victor Franca on 03/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoValorFormViewController: UIViewController {
    
    static var valorLancamento: Double = 0

    @IBOutlet weak var lblValor: UILabel!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnClean: UIButton!
    @IBOutlet weak var btnBackSpace: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnCleanTapped(_ sender: Any) {
        LancamentoValorFormViewController.valorLancamento = 0
        lblValor.text = LancamentoValorFormViewController.valorLancamento.formattedWithSeparator
    }
    
    @IBAction func btnBackSpaceTapped(_ sender: Any) {
        LancamentoValorFormViewController.valorLancamento = (LancamentoValorFormViewController.valorLancamento / 10).truncate(places: 2)
        lblValor.text = LancamentoValorFormViewController.valorLancamento.formattedWithSeparator
    }
    
    
    @IBAction func btnOkTapped(_ sender: Any) {
    }
    
    
    @IBAction func btn0Tapped(_ sender: Any) {
        updateNumber(0)
        updateNumberLabel()
    }
    
    @IBAction func btn1Tapped(_ sender: Any) {
        updateNumber(1)
        updateNumberLabel()
    }
    
    @IBAction func btn2Tapped(_ sender: Any) {
        updateNumber(2)
        updateNumberLabel()
    }
    
    @IBAction func btn3Tapped(_ sender: Any) {
        updateNumber(3)
        updateNumberLabel()
    }
    
    @IBAction func btn4Tapped(_ sender: Any) {
        updateNumber(4)
        updateNumberLabel()
    }
    
    @IBAction func btn5Tapped(_ sender: Any) {
        updateNumber(5)
        updateNumberLabel()
    }
    
    @IBAction func btn6Tapped(_ sender: Any) {
        updateNumber(6)
        updateNumberLabel()
    }
    
    @IBAction func btn7Tapped(_ sender: Any) {
        updateNumber(7)
        updateNumberLabel()
    }
    
    @IBAction func btn8Tapped(_ sender: Any) {
        updateNumber(8)
        updateNumberLabel()
    }
    
    @IBAction func btn9Tapped(_ sender: Any) {
        updateNumber(9)
        updateNumberLabel()
    }
    
    fileprivate func updateNumberLabel() {
        lblValor.text = LancamentoValorFormViewController.valorLancamento.formattedWithSeparator
    }
    
    fileprivate func updateNumber(_ i: Double) {
        let newNumber = (LancamentoValorFormViewController.valorLancamento * 10) + (i / 100)
        if(newNumber.isLess(than: 9999999.99)){
            LancamentoValorFormViewController.valorLancamento = newNumber
        }
    }
    
}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
    
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
