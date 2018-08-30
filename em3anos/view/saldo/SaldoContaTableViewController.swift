//
//  SaldoContaTableViewController.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class SaldoContaTableViewController: UITableViewController {
    
    var saldos: [SaldoConta] = []
    
    private func loadSaldos(){
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSaldos()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 36
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "saldoTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SaldoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SaldoTableViewCell.")
        }
        
        let urlString = URL(string: "http://localhost:8080/meussaldos-1.0-SNAPSHOT/services/saldosFuturosPrevistos")
        
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    guard let saldos = try? JSONDecoder().decode([SaldoConta].self, from: data!) else {
                        print("Error: Couldn't decode data into Saldo")
                        Thread.callStackSymbols.forEach{print($0)}
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.saldos += saldos
                        
                        let saldo = self.saldos[indexPath.row]
                        
                        cell.lblAno.text = String(saldo.ano!)
                        cell.lblMes.text = String(saldo.mes!)
                        
                        
                        cell.lblValor.text = String(format: "%.02f", saldo.valor)
                        
                    }
                }
            }
            task.resume()
        }
        
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
