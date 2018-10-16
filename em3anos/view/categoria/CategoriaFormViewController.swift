//
//  CategoriaFormViewController.swift
//  em3anos
//
//  Created by Victor Franca on 03/10/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class CategoriaFormViewController: UIViewController {
    
    var categoriaId: Int?
    var categoria: Categoria?

    @IBOutlet weak var btnTrash: UIBarButtonItem!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var selectTipo: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItems?.removeAll()
        self.navigationItem.rightBarButtonItems?.append(btnDone)
        if(categoriaId != nil){
            self.navigationItem.rightBarButtonItems?.append(self.btnTrash)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carregarDadosComponentes()
    }
    
    fileprivate func carregarDadosComponentes() {
        if(categoriaId == nil){
            categoriaId = -1
            categoria = Categoria()
            categoria?.tipo = Categoria.TIPO_DESPESA
        }else{
            selectTipo.isEnabled = false
            
            CategoriaService().find(uid: (categoriaId)!){categoria in
                self.categoria = categoria
                
                DispatchQueue.main.async {
                    let tipo = self.categoria!.tipo
                    self.selectTipo.selectedSegmentIndex = Int(tipo)!
                    self.txtNome.text = self.categoria!.nome
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.categoria?.tipo = String(selectTipo.selectedSegmentIndex)
        self.categoria?.nome = txtNome.text!

        CategoriaService().save(categoria: categoria!){_ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "unwindToCategoriaDataTable", sender: self)
            }
        }
    }
    
    @IBAction func btnRemoveTapped(_ sender: Any) {
        CategoriaService().remove(uid: String(categoria!.id!)){_ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "unwindToCategoriaDataTable", sender: self)
            }
        }
    }

}
