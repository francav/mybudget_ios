//
//  CategoriaSelectViewController.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class CategoriaSelectViewController: UITableViewController {
    
    var categorias: [Categoria] = []
    
    var tipoCategoria: Int? = nil
    
    var selectedCategoria : Categoria?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        CategoriaService().find(tipoCategoria){categorias in
            self.categorias = categorias
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.navigationItem.title  = "Categorias";
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(!categorias.isEmpty){
            return categorias.count
        }
        return 0;
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let categoria = categorias[indexPath.row];

        selectedCategoria = categoria

        let lancamentoFormViewController = navigationController?.viewControllers[(navigationController?.viewControllers.count)!-2] as! LancamentoFormViewController
        
        lancamentoFormViewController.selectedCategoria = self.selectedCategoria

        navigationController?.popToRootViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "categoriaSelectTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoriaSelectTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CategoriaTableViewCell.")
        }
        
        if(!categorias.isEmpty){
            let categoria = self.categorias[indexPath.row]
            
            DispatchQueue.main.async {
                cell.lblNomeCategoria.text = String(categoria.nome)
            }
        }
        
        return cell
        
    }

}
