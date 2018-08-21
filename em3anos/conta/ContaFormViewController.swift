//
//  ContaViewController.swift
//  em3anos
//
//  Created by Victor Franca on 13/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ContaFormViewController: UIViewController {
    
    var conta: ContaBanco?

    @IBOutlet weak var txtNome: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        conta = ContaBanco(nome: txtNome.text!, saldoInicial: 0)
        
        ServicesFacade().saveConta(conta: conta!){_ in
            self.dismiss(animated: true, completion: nil)
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
