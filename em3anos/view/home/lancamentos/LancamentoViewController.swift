//
//  LancamentoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 23/08/2018.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class LancamentoViewController: UIViewController
{
    @IBOutlet weak var periodoCarousel: iCarousel!
    @IBOutlet weak var tableLancamento: UITableView!
    
    var periodos: [String] = []
    var lancamentos : [Lancamento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        periodos = ["08/2018", "09/2018", "10/2018", "11/2018", "12/2018", "01/2019", "02/2019", "03/2019", "04/2019", "05/2019", "06/2019", "07/2019", "08/2019", "09/2019", "10/2019", "11/2019", "12/2019", "01/2020", "02/2020", "03/2020", "04/2020", "05/2020", "06/2020", "07/2020", "08/2020", "09/2020", "10/2020", "11/2020", "12/2020", "01/2021", "02/2021", "03/2021", "04/2021", "05/2021", "06/2021", "07/2021"]
        
        periodoCarousel.type = .coverFlow2
        periodoCarousel.reloadData()

        let anoMes = periodos[0]
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        loadData(ano, mes)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func loadData(_ ano: String, _ mes: String) {
        LancamentoService().find(ano, mes){lancamentos in
            self.lancamentos = lancamentos
            
            DispatchQueue.main.async {
                self.tableLancamento.reloadData()
            }
        }
    }
    
}


extension LancamentoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lancamentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cellIdentifier = "lancamentoTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LancamentoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LancamentoTableViewCell.")
        }
        
        if(!lancamentos.isEmpty){
            
            let lancamento: Lancamento = lancamentos[indexPath.row]
            
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = Locale(identifier: "pt_BR")
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd/MM/yyyy"
            cell.lblData.text = dateFormatterPrint.string(for: lancamento.data)
            
            cell.lblSaldo.text = numberFormatter.string(from: NSNumber(value: lancamento.saldo))
            if(lancamento.saldo < 0){
                cell.lblSaldo.textColor = UIColor.red
            }else {
                cell.lblSaldo.textColor = UIColor.blue
            }
            
            cell.lblValor.text = numberFormatter.string(from: NSNumber(value: lancamento.valor))
            if(lancamento.valor < 0){
                cell.lblValor.textColor = UIColor.red
            }else {
                cell.lblValor.textColor = UIColor.blue
            }

            
            cell.lblConta.text = lancamento.conta
            
            if(lancamento.contaOrigem != nil){
                cell.lblConta.text?.append("-" + lancamento.contaOrigem!)
            }
            if(lancamento.contaDestino != nil){
                cell.lblConta.text?.append("-" + lancamento.contaDestino!)
                
            }
            
            if(lancamento.ajuste){
                cell.lblCategoria.text = "Ajuste"
            }
            if(lancamento.categoria != nil){
                cell.lblCategoria.text = lancamento.categoria
            }
            if(lancamento.cartaoCreditoFatura != nil){
                cell.lblCategoria.text = "Fatura " + lancamento.cartaoCreditoFatura!
            }
            if(lancamento.saldoInicial){
                cell.lblCategoria.text = "Saldo Inicial"
            }
            
            cell.lblComentario.text = lancamento.comentario
        }
        
        return cell
    }
    
}

extension LancamentoViewController: iCarouselDataSource, iCarouselDelegate{
    
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
