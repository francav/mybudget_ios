//
//  ContaSelectTableViewController.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ContaSelectTableViewController: UITableViewController {

    var contas: [Conta] = []
    
    //var tipoCategoria: Int? = nil
    
    var selectedConta : Conta?
    
    var tipo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        if(tipo == 0){
            ContaService().find(){contas in
                self.contas = contas
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }else if(tipo == 1){
            ContaService().findBancos(){contas in
                self.contas = contas
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        self.navigationItem.title  = "Contas";
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(!contas.isEmpty){
            return contas.count
        }
        return 0;
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let conta = contas[indexPath.row];
        
        selectedConta = conta
        
        let lancamentoFormViewController = navigationController?.viewControllers[(navigationController?.viewControllers.count)!-2] as! LancamentoFormViewController
        
        lancamentoFormViewController.selectedConta = self.selectedConta
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "contaSelectTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContaSelectTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ContaTableViewCell.")
        }
        
        if(!contas.isEmpty){
            let conta = self.contas[indexPath.row]
            
            DispatchQueue.main.async {
                cell.nomeContaLabel.text = conta.nome
            }
        }
        
        return cell
        
    }

}
