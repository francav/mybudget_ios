//
//  ContaViewController.swift
//  em3anos
//
//  Created by Victor Franca on 13/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ContaFormViewController: UIViewController {
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var btnTrash: UIBarButtonItem!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtSaldoInicial: UITextField!
    
    var conta: ContaBanco?
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        self.navigationItem.rightBarButtonItems?.removeAll()
        self.navigationItem.rightBarButtonItems?.append(btnDone)
        
        if(conta != nil){
            self.navigationItem.rightBarButtonItems?.append(btnTrash)
            txtNome.text = conta!.nome
            txtSaldoInicial.text = numberFormatter.string(from: NSNumber(value: conta!.saldoInicial!))
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "unwindToContaDataTable", sender: self)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let saldoString = txtSaldoInicial.text
        let saldoNumber = numberFormatter.number(from: saldoString!)
        let saldoDouble = saldoNumber?.doubleValue
        
        let conta = ContaBanco()
        conta.nome = txtNome.text!
        conta.saldoInicial = saldoDouble!
        
        if(self.conta != nil){
            conta.id = self.conta!.id
        }
        
        ContaService().save(conta: conta){_ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "unwindToContaDataTable", sender: self)
            }
        }
    }

    @IBAction func removeButtonTapped(_ sender: UIBarButtonItem) {
        ContaService().remove(uid: String(conta!.id!)){_ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "unwindToContaDataTable", sender: self)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
