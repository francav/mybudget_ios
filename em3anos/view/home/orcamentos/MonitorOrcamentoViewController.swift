//
//  MonitorOrcamentoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class MonitorOrcamentoViewController: UIViewController {
    
    @IBOutlet weak var datasCarousel: iCarousel!
    @IBOutlet weak var table: UITableView!
    
    var itens: [OrcadoReal] = []
    
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
        OrcamentoService().orcadoRealDespesas(ano, mes){itens in
            self.itens = itens
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MonitorOrcamentoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "monitorOrcamentoTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MonitorOrcamentoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MonitorOrcamentoTableCell.")
        }
        
        if(!itens.isEmpty){
            
            let saldo = itens[indexPath.row]
            let andamento = Float((saldo.realizado / saldo.orcado))
            cell.progressBar.progress = andamento
            if(andamento > 1){
                cell.progressBar.tintColor = UIColor.red
            }else{
                cell.progressBar.tintColor = UIColor.blue
            }
            cell.lblCategoria.text = saldo.categoria! + " (\(andamento * 100)%)"
            cell.lblOrcadoRealizado.text = "R$\(saldo.realizado) de R$\(saldo.orcado)"
        }
        
        return cell
    }
    
}

extension MonitorOrcamentoViewController: iCarouselDataSource, iCarouselDelegate{
    
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
        label.textColor = .white
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

