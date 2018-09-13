//
//  CartaoTableViewController.swift
//  em3anos
//
//  Created by Victor Franca on 21/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class CartaoTableViewController: UITableViewController {

//    var contas: [Cartao] = []
//    
//    @IBOutlet weak var btnAdd: UIBarButtonItem!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
////        self.tabBarController?.navigationItem.rightBarButtonItem = btnAdd
////
//        
//        CartaoService().find(){cartoes in
//            self.contas = cartoes 
//            
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//        
//        self.parent?.navigationItem.title  = "Cartões";
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        if(!contas.isEmpty){
//            return contas.count
//        }
//        return 0;
//    }
//    
//    
//    var selectedConta: Cartao?
//    
//    //MARK: - UITableViewDelegate
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let conta = contas[indexPath.row];
//        
//        selectedConta = conta
//        
//        performSegue(withIdentifier: "showCartaoSegue", sender: nil)
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellIdentifier = "cartaoTableViewCell"
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CartaoTableViewCell  else {
//            fatalError("The dequeued cell is not an instance of CartaoTableViewCell.")
//        }
//        
//        if(!contas.isEmpty){
//            let conta = self.contas[indexPath.row]
//            
//            DispatchQueue.main.async {
//                cell.lblNome.text = String(conta.nome)
//            }
//        }
//        
//        return cell
//        
//    }
//    
//    // Mark: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "showCartaoSegue"){
//            let cartaoFormViewController = segue.destination as! CartaoFormViewController
//            cartaoFormViewController.cartao = selectedConta
//        }
//    }
//    
//    @IBAction func unwindToCartaoDataTable(segue: UIStoryboardSegue) {
//        
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
