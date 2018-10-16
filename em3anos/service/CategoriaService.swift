//
//  CategoriaService.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class CategoriaService{
    
    func save(categoria: Categoria, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "categorias/").invoke(categoria){token in
            completion(&token)
        }
    }
    
    func remove(uid: String, _ completion: @escaping (inout String) -> Void){
        HttpDeleteService.init(servicePath: "categorias/" + uid).invoke(uid){token in
            completion(&token)
        }
    }
    
    func find(uid: Int, _ completion: @escaping (inout Categoria) -> Void){
        HttpGetService.init(servicePath: "categorias/\(uid)").invoke(Categoria.self){categoria in
            completion(&categoria)
        }
    }
    
    func find(_ tipo: Int? = nil, _ completion: @escaping (inout [Categoria]) -> Void){
        
        var path = "categorias/"
        if(tipo != nil && tipo == 0){
            path.append("receitas")
        }else if (tipo != nil){
            path.append("despesas")
        }
        
        HttpGetService.init(servicePath: path).invoke([Categoria].self){categorias in
            completion(&categorias)
        }
    }
    
    
}
