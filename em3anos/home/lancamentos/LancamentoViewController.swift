//
//  LancamentoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 23/08/18.
//  Copyright © 18 Victor Franca. All rights reserved.
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
        
        periodos = ["08/18", "09/18", "10/18", "11/18", "12/18", "01/19", "02/19", "03/19", "04/19", "05/19", "06/19", "07/19", "08/19", "09/19", "10/19", "11/19", "12/19", "01/20", "02/20", "03/20", "04/20", "05/20", "06/20", "07/20", "08/20", "09/20", "10/20", "11/20", "12/20", "01/21", "02/21", "03/21", "04/21", "05/21", "06/21", "07/21"]
        
        // Lançamento de Saldo Inicial
        var lancamento = Lancamento()
        lancamento.categoria = ""
        lancamento.saldoInicial = true
        lancamento.comentario = ""
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.saldo = 99999.99
        lancamento.valor = 99999.99
        lancamentos.append(lancamento)
        
        // Lançamento regular
        lancamento = Lancamento()
        lancamento.categoria = "Moradia-Aluguel"
        lancamento.comentario = "Pagamento legislar"
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.saldo = 99999.99
        lancamento.valor = 99999.99
        lancamentos.append(lancamento)
        
        // Lançamento negativo
        lancamento = Lancamento()
        lancamento.categoria = "Moradia-Aluguel"
        lancamento.comentario = "Pagamento legislar"
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.valor = -99999.99
        lancamento.saldo = 99999.99
        lancamentos.append(lancamento)
        
        // Lançamento saldo negativo
        lancamento = Lancamento()
        lancamento.categoria = "Moradia-Aluguel"
        lancamento.comentario = "Pagamento legislar"
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.valor = 99999.99
        lancamento.saldo = -99999.99
        
        lancamentos.append(lancamento)
        
        // Lançamento  e saldo negativos
        lancamento = Lancamento()
        lancamento.categoria = "Moradia-Aluguel"
        lancamento.comentario = "Pagamento legislar"
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.valor = -99999.99
        lancamento.saldo = -99999.99
        lancamentos.append(lancamento)
        
        // Lançamento de transferência(Saída)
        lancamento = Lancamento()
        lancamento.categoria = "<== ==>"
        lancamento.comentario = "Transferência(Saída)"
        lancamento.conta = "Banco do Brasil"
        lancamento.contaDestino = "Bradesco"
        lancamento.data = Date.init()
        lancamento.saldo = 99999.99
        lancamento.valor = 99999.99
        lancamentos.append(lancamento)
        
        // Lançamento de transferência(Entrada)
        lancamento = Lancamento()
        lancamento.categoria = "<== ==>"
        lancamento.comentario = "Transferência(Entrada)"
        lancamento.conta = "Banco do Brasil"
        lancamento.contaOrigem = "Bradesco"
        lancamento.data = Date.init()
        lancamento.saldo = 99999.99
        lancamento.valor = 99999.99
        lancamentos.append(lancamento)
        
        // Lançamento de Ajuste
        lancamento = Lancamento()
        lancamento.categoria = nil
        lancamento.ajuste = true
        lancamento.comentario = "Pagamento legislar"
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.saldo = 99999.99
        lancamento.valor = 99999.99
        lancamentos.append(lancamento)
        
        // Lançamento de Fatura de Cartão
        lancamento = Lancamento()
        lancamento.categoria = nil
        lancamento.cartaoCreditoFatura = "Nubank"
        lancamento.comentario = "Pagamento legislar"
        lancamento.conta = "Banco do Brasil"
        lancamento.data = Date.init()
        lancamento.saldo = 99999.99
        lancamento.valor = 99999.99
        lancamentos.append(lancamento)
        
        self.tableLancamento.reloadData()
        
        periodoCarousel.type = .coverFlow2
        periodoCarousel.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd/MM/yyyy"
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = Locale.current
            
            cell.lblData.text = dateFormatterPrint.string(for: lancamento.data)
            
            cell.lblSaldo.text = numberFormatter.string(from: NSNumber(value: lancamento.saldo))
            if(lancamento.saldo < 0){
                cell.lblSaldo.textColor = UIColor.red
            }else {
                cell.lblSaldo.textColor = UIColor.black
            }
            
            cell.lblValor.text = numberFormatter.string(from: NSNumber(value: lancamento.valor))
            if(lancamento.valor < 0){
                cell.lblValor.textColor = UIColor.red
            }else {
                cell.lblValor.textColor = UIColor.black
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
        //        lblPeriodoEscolhido.text = periodos[carousel.currentItemIndex]
    }
}
