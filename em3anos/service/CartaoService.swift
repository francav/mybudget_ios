//
//  CartaoFacade.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class CartaoService{
    
    func save(cartao: Cartao, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "cartoes/").invoke(cartao){token in
            completion(&token)
        }
    }
    
    func remove(uid: String, _ completion: @escaping (inout String) -> Void){
        HttpDeleteService.init(servicePath: "cartoes/" + uid).invoke(uid){token in
            completion(&token)
        }
    }
    
    func find(_ completion: @escaping (inout [Cartao]) -> Void){
        HttpGetService.init(servicePath: "cartoes/").invoke([Cartao].self){cartoes in
            completion(&cartoes)
        }
    }
    
}
