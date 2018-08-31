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
    
    let periodos: [String] = ["08/2018", "09/2018", "10/2018", "11/2018", "12/2018", "01/2019", "02/2019", "03/2019", "04/2019", "05/2019", "06/2019", "07/2019", "08/2019", "09/2019", "10/2019", "11/2019", "12/2019", "01/2020", "02/2020", "03/2020", "04/2020", "05/2020", "06/2020", "07/2020", "08/2020", "09/2020", "10/2020", "11/2020", "12/2020", "01/2021", "02/2021", "03/2021", "04/2021", "05/2021", "06/2021", "07/2021"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasCarousel.type = .coverFlow2
        datasCarousel.reloadData()
        
        let anoMes = periodos[0]
        let anoMesString = anoMes.split(separator: "/")
        let ano = String(anoMesString[1])
        let mes = String(anoMesString[0])
        
        loadData(ano, mes)

        // Do any additional setup after loading the view.
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

