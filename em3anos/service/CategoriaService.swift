//
//  CategoriaService.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class CategoriaService{
    
    func find(_ tipo: Int? = nil, _ completion: @escaping (inout [Categoria]) -> Void){
        
        var path = "categorias/"
        if(tipo != nil){
            path.append("\(tipo!)")
        }
        
        HttpGetService.init(servicePath: path).invoke([Categoria].self){categorias in
            completion(&categorias)
        }
    }
    
    
}
