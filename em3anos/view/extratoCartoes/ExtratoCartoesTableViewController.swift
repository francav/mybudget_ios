//
//  ExtratoCartõesTableViewController.swift
//  em3anos
//
//  Created by Victor Franca on 14/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ExtratoCartoesTableViewController: UIViewController{
    
    @IBOutlet weak var tableLancamento: UITableView!
    @IBOutlet weak var periodoCarousel: iCarousel!
    
    var lancamentos : [LancamentoCartao] = []
    
    var periodoIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        periodoCarousel.type = .coverFlow2
        periodoCarousel.reloadData()
        
        periodoIndex = HomeViewController.periodos.index(where: {$0 == AnoMes(date: Date.init()).string()})!
        
        periodoCarousel.currentItemIndex = periodoIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        periodoCarousel.currentItemIndex = periodoIndex
        
        let anoMes = HomeViewController.periodos[periodoCarousel.currentItemIndex]
        
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        
        loadData(ano, mes)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func loadData(_ ano: String, _ mes: String) {
        LancamentoService().extratoCartao(ano, mes){lancamentos in
            self.lancamentos = lancamentos
            
            DispatchQueue.main.async {
                self.tableLancamento.reloadData()
            }
        }
    }
    
}

extension ExtratoCartoesTableViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorStyle = .none
        return lancamentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cellIdentifier = "extratoCartaoTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExtratoCartaoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LancamentoTableViewCell.")
        }
        
        if(!lancamentos.isEmpty){
            
            let lancamento: LancamentoCartao = lancamentos[indexPath.row]
            
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = Locale(identifier: "pt_BR")
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd/MM/yyyy"
            cell.lblData.text = dateFormatterPrint.string(for: lancamento.dataCompra)
            
            cell.lblSaldo.text = numberFormatter.string(from: NSNumber(value: lancamento.saldo))
//            if(lancamento.saldo < 0){
//                cell.lblSaldo.textColor = UIColor.red
//            }else {
//                cell.lblSaldo.textColor = UIColor.blue
//            }
            
            cell.lblValorCompra.text = numberFormatter.string(from: NSNumber(value: lancamento.valorCompra))
            let indiceParcela = String("(\(lancamento.indiceParcelas!) de \(lancamento.qtdParcelas!))")
            cell.lblValorParcela.text = String("\(indiceParcela) \(numberFormatter.string(from: NSNumber(value: lancamento.valorParcela))!)")
//            if(lancamento.valor < 0){
//                cell.lblValorCompra.textColor = UIColor.red
//            }else {
//                cell.lblValorCompra.textColor = UIColor.blue
//            }
            
            
            cell.lblBanco.text = lancamento.conta
            
//            if(lancamento.contaOrigem != nil){
//                cell.lblBanco.text?.append("-" + lancamento.contaOrigem!)
//            }
//            if(lancamento.contaDestino != nil){
//                cell.lblBanco.text?.append("-" + lancamento.contaDestino!)
//
//            }
            
//            if(lancamento.ajuste){
//                cell.lblCategoria.text = "Ajuste"
//            }
            if(lancamento.categoria != nil){
                cell.lblCategoria.text = lancamento.categoria
            }else{
                cell.lblCategoria.text = ""
            }
                        
            cell.lblComentario.text = lancamento.comentario
            
            cell.btnStatus.setImage(lancamento.status == "1" ? #imageLiteral(resourceName: "outline_check_box_outline_blank_black_24dp") : #imageLiteral(resourceName: "outline_check_box_black_24dp"), for: .normal)
        }
        
        return cell
    }
}

extension ExtratoCartoesTableViewController: iCarouselDataSource, iCarouselDelegate{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return HomeViewController.periodos.count
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 48))
        
        var label: UILabel
        label = UILabel(frame: tempView.bounds)
        label.backgroundColor = .clear
        label.textColor = .white
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
        periodoIndex = carousel.currentItemIndex
        
        let anoMes = HomeViewController.periodos[carousel.currentItemIndex]
        
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        
        loadData(ano, mes)
    }
}

