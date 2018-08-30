//
//  MonitorOrcamentoViewController.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class MonitorOrcamentoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MonitorOrcamentoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "monitorOrcamentoTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MonitorOrcamentoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MonitorOrcamentoTableCell.")
        }
        
        cell.progressBar.progress = 1 * Float(arc4random() % 100) / 100
        cell.lblCategoria.text = "Categoria X"
        cell.lblOrcadoRealizado.text = "R$ 999.999,99 de R$ 999.999,99"
        
        return cell
    }
    
}
