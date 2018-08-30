//
//  ContaFacade.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class ContaService{
    
    func save(conta: ContaBanco, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "contasBancos/").invoke(conta){token in
            completion(&token)
        }
    }
    
    func remove(uid: String, _ completion: @escaping (inout String) -> Void){
        HttpDeleteService.init(servicePath: "contasBancos/" + uid).invoke(uid){token in
            completion(&token)
        }
    }
    
    func find(_ completion: @escaping (inout [ContaBanco]) -> Void){
        (HttpGetService).init(servicePath: "contasBancos/").invoke([ContaBanco].self){contas in
            completion(&contas)
        }
    }


}
