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
        
        (HttpGetService).init(servicePath: "contasDinheiro/").invoke([Conta].self){contasDinheiro in
            
            var contas = contasDinheiro

            HttpGetService.init(servicePath: "contasBancos/").invoke([Conta].self){contasBanco in
                
                contas.append(contentsOf: contasBanco)
                
                HttpGetService.init(servicePath: "cartoes/").invoke([Conta].self){cartoes in
                    
                    contas.append(contentsOf: cartoes)
                    
                    completion(&contas)
                }
            }
        }
    }
    
    func findCartoes(_ completion: @escaping (inout [Conta]) -> Void){
        HttpGetService.init(servicePath: "cartoes/").invoke([Conta].self){cartoes in
            completion(&cartoes)
        }
    }

    func findBancos(_ completion: @escaping (inout [Conta]) -> Void){
        (HttpGetService).init(servicePath: "contasDinheiro/").invoke([Conta].self){contasDinheiro in
            
            var contas = contasDinheiro
            
            HttpGetService.init(servicePath: "contasBancos/").invoke([Conta].self){contasBanco in
                
                contas.append(contentsOf: contasBanco)
                
                completion(&contas)
            }
        }
    }
}
