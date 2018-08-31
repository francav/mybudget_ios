//
//  PainelSaldoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class PainelSaldoViewController: UIViewController {
    
    
    @IBOutlet weak var datasCarousel: iCarousel!
    let periodos: [String] = ["08/2018", "09/2018", "10/2018", "11/2018", "12/2018", "01/2019", "02/2019", "03/2019", "04/2019", "05/2019", "06/2019", "07/2019", "08/2019", "09/2019", "10/2019", "11/2019", "12/2019", "01/2020", "02/2020", "03/2020", "04/2020", "05/2020", "06/2020", "07/2020", "08/2020", "09/2020", "10/2020", "11/2020", "12/2020", "01/2021", "02/2021", "03/2021", "04/2021", "05/2021", "06/2021", "07/2021"]
    
    @IBOutlet weak var lblSaldoAnterior: UILabel!
    @IBOutlet weak var lblSaldoCorrente: UILabel!

    @IBOutlet weak var lblDespesaOrcada: UILabel!
    @IBOutlet weak var lblReceitaOrcada: UILabel!
    
    @IBOutlet weak var lblSaldoFinalPrevisto: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasCarousel.type = .coverFlow2
        datasCarousel.reloadData()
        
        let anoMes = periodos[0]
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        loadData(ano, mes)
    }
    
    fileprivate func loadData(_ ano: String, _ mes: String) {
        SaldoContaService().findInicial(ano, mes){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblSaldoAnterior.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findCorrente(ano, mes){saldo in
            let saldoConta  = saldo
            
            DispatchQueue.main.async {
                self.lblSaldoCorrente.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findDespesaOrcada(ano, mes){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblDespesaOrcada.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findReceitaOrcada(ano, mes){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblReceitaOrcada.text = String(saldoConta.valor)
            }
        }
        
        SaldoContaService().findPrevisto(ano, mes){saldo in
            let saldoConta  = saldo
            DispatchQueue.main.async {
                self.lblSaldoFinalPrevisto.text = String(saldoConta.valor)
            }
        }
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

extension PainelSaldoViewController: iCarouselDataSource, iCarouselDelegate{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return periodos.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 48))
        
        var label: UILabel
        label = UILabel(frame: tempView.bounds)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.tag = 1
        label.text = periodos[index]
        tempView.addSubview(label)
        
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch option {
        case .spacing:
            return value * 1.0
        case .wrap:
            return 1
        case .visibleItems:
            return 3
        default:
            return value
        }
        
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let anoMes = periodos[carousel.currentItemIndex]
        
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        
        loadData(ano, mes)
    }
}
