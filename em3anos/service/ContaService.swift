//
//  ContaService.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class ContaService{
    
    func find(_ completion: @escaping (inout [Conta]) -> Void){
        HttpGetService.init(servicePath: "contas/").invoke([Conta].self){contas in
            completion(&contas)
        }
    }
    
    func find(uid: Int, _ completion: @escaping (inout Conta) -> Void){
        HttpGetService.init(servicePath: "contas/\(uid)").invoke(Conta.self){conta in
            completion(&conta)
        }
    }
    
    func save(conta: Conta, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "contas/").invoke(conta){token in
            completion(&token)
        }
    }
    
    func remove(uid: String, _ completion: @escaping (inout String) -> Void){
        HttpDeleteService.init(servicePath: "contas/" + uid).invoke(uid){token in
            completion(&token)
        }
    }
    
    func findCartoes(_ completion: @escaping (inout [Conta]) -> Void){
        HttpGetService.init(servicePath: "cartoes/").invoke([Conta].self){cartoes in
            completion(&cartoes)
        }
    }

    func findContasCorrente(_ completion: @escaping (inout [Conta]) -> Void){
        (HttpGetService).init(servicePath: "contasDinheiro/").invoke([Conta].self){contasDinheiro in
            
            var contas = contasDinheiro
            
            HttpGetService.init(servicePath: "contasBancos/").invoke([Conta].self){contasBanco in
                
                contas.append(contentsOf: contasBanco)
                
                completion(&contas)
            }
        }
    }
}
