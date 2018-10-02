//
//  ContaTableViewController.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class ContaTableViewController: UITableViewController {
    
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    
    var contas: [Conta] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.navigationItem.rightBarButtonItem = btnAdd
//
        ContaService().find(){contas in
            self.contas = contas
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.parent?.navigationItem.title  = "Contas";
        self.tableView.separatorStyle = .none
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
    
    
    var selectedConta: Conta?
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let conta = contas[indexPath.row];
        
        selectedConta = conta
        
        performSegue(withIdentifier: "editContaSegue", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "contaTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContaTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ContaTableViewCell.")
        }
        
        if(!contas.isEmpty){
            let conta = self.contas[indexPath.row]
            
            DispatchQueue.main.async {
                cell.lblNomeConta.text = String(conta.nome)
                cell.lblTipoConta.text = conta.tipoString()
            }
        }

        return cell
        
    }
    
    // Mark: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editContaSegue"){
            let contaFormViewController = segue.destination as! ContaFormViewController
            contaFormViewController.contaId = selectedConta?.id
        }
    }
    
    @IBAction func unwindToContaDataTable(segue: UIStoryboardSegue) {
        
    }

}
