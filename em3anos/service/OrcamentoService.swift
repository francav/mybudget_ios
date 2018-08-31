//
//  OrcamentoService.swift
//  em3anos
//
//  Created by Victor Franca on 31/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class OrcamentoService{
    
    func orcadoRealDespesas(_ ano: String, _ mes: String, _ completion: @escaping (inout [OrcadoReal]) -> Void){
        (HttpGetService).init(servicePath: "orcamentos/ano/\(ano)/mes/\(mes)/despesas/categoria").invoke([OrcadoReal].self){contas in
            completion(&contas)
        }
    }

    func orcadoRealReceitas(_ ano: String, _ mes: String, _ completion: @escaping (inout [OrcadoReal]) -> Void){
        (HttpGetService).init(servicePath: "orcamentos/ano/\(ano)/mes/\(mes)/receitas/categoria").invoke([OrcadoReal].self){contas in
            completion(&contas)
        }
    }

    
}
