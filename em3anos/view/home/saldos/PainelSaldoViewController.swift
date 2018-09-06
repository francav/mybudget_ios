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
    
    @IBOutlet weak var lblSaldoAnterior: UILabel!
    @IBOutlet weak var lblSaldoCorrente: UILabel!

    @IBOutlet weak var lblDespesaOrcada: UILabel!
    @IBOutlet weak var lblReceitaOrcada: UILabel!
    
    @IBOutlet weak var lblSaldoFinalPrevisto: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasCarousel.type = .coverFlow2
        datasCarousel.reloadData()
        
        datasCarousel.currentItemIndex = HomeViewController.periodoIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        datasCarousel.currentItemIndex = HomeViewController.periodoIndex
        
        let anoMes = HomeViewController.periodos[datasCarousel.currentItemIndex]
        
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
        return HomeViewController.periodos.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 48))
        
        var label: UILabel
        label = UILabel(frame: tempView.bounds)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.tag = 1
        label.text = HomeViewController.periodos[index]
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
        HomeViewController.periodoIndex = carousel.currentItemIndex
        
        let anoMes = HomeViewController.periodos[carousel.currentItemIndex]
        
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        
        loadData(ano, mes)
    }
}
