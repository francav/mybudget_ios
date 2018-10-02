//
//  CategoriaTableViewController.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class CategoriaTableViewController: UITableViewController {
    
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    
    var categorias: [Categoria] = []
    var categoriasFiltradas: [Categoria] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let receitaLabel = "Receitas"
    let despesaLabel = "Despesas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar Categorias"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = [receitaLabel, despesaLabel]
        searchController.searchBar.delegate = self
    }
    
    fileprivate func loadCategorias(_ tipo: Int? = nil) {
        //        self.tabBarController?.navigationItem.rightBarButtonItem = btnAdd
        //
        CategoriaService().find(tipo){categorias in
            self.categorias = categorias
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(searchController.searchBar.selectedScopeButtonIndex)
        loadCategorias()
        
        self.parent?.navigationItem.title  = "Categorias";
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
        if(!categorias.isEmpty){
            if isFiltering() {
                return categoriasFiltradas.count
            } else {
                return categorias.count
            }
        }
        return 0;
    }
    
    
    var selectedCategoria: Categoria?
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let categoria: Categoria
        if isFiltering() {
            categoria = self.categoriasFiltradas[indexPath.row]
        } else {
            categoria = self.categorias[indexPath.row]
        }

        selectedCategoria = categoria
        
        performSegue(withIdentifier: "editCategoriaSegue", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "categoriaTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoriaTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CategoriaTableViewCell.")
        }
        
        if(!categorias.isEmpty){
            let categoria: Categoria
            if isFiltering() {
                categoria = self.categoriasFiltradas[indexPath.row]
            } else {
                categoria = self.categorias[indexPath.row]
            }
            
            DispatchQueue.main.async {
                cell.lblNomeCategoria.text = String(categoria.nome)
//                cell.lblTipoCategoria.text = categoria.tipoString()
            }
        }
        
        return cell
        
    }
    
    // Mark: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editCategoriaSegue"){
//            let categoriaFormViewController = segue.destination as! CategoriaFormViewController
//            categoriaFormViewController.categoriaId = selectedCategoria?.id
        }
    }
    
    @IBAction func unwindToCategoriaDataTable(segue: UIStoryboardSegue) {
        
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "Despesas") {
        self.categoriasFiltradas = categorias.filter({( categoria : Categoria) -> Bool in
            var doesCategoryMatch = (categoria.tipo == (scope == receitaLabel ? String(0) : String(1)))
            if (!searchBarIsEmpty()) {
                doesCategoryMatch = doesCategoryMatch && categoria.nome.lowercased().contains(searchText.lowercased())
            }
            return doesCategoryMatch
        })

        self.tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        //let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive// && (!searchBarIsEmpty())
    }
}

extension CategoriaTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension CategoriaTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
