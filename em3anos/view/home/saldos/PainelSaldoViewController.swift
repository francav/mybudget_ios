//
//  PainelSaldoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class PainelSaldoViewController: UIViewController {
    
    
    @IBOutlet weak var lblSaldoAnterior: UILabel!
    @IBOutlet weak var lblSaldoCorrente: UILabel!

    @IBOutlet weak var lblDespesaOrcada: UILabel!
    @IBOutlet weak var lblReceitaOrcada: UILabel!
    
    @IBOutlet weak var lblSaldoFinalPrevisto: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SaldoContaService().findInicial("2018", "08"){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblSaldoAnterior.text = String(saldoConta.valor)
            }
            
        }
        
        SaldoContaService().findCorrente("2018", "08"){saldo in
            let saldoConta  = saldo
            
            DispatchQueue.main.async {
                self.lblSaldoCorrente.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findDespesaOrcada("2018", "08"){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblDespesaOrcada.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findReceitaOrcada("2018", "08"){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblReceitaOrcada.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findPrevisto("2018", "08"){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblSaldoFinalPrevisto.text = String(saldoConta.valor)
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
