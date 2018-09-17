//
//  LancamentoService.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class LancamentoService{
    
    func save(lancamento: Lancamento, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "lancamentos/").invoke(lancamento){token in
            completion(&token)
        }
    }
    
    func remove(uid: String, _ completion: @escaping (inout String) -> Void){
        HttpDeleteService.init(servicePath: "lancamentos/" + uid).invoke(uid){token in
            completion(&token)
        }
    }
    
    func find(_ ano: String, _ mes: String, _ completion: @escaping (inout [Lancamento]) -> Void){
        HttpGetService.init(servicePath: "lancamentos/" + "ano/\(ano)" + "/mes/\(mes)").invoke([Lancamento].self){cartoes in
            completion(&cartoes)
        }
    }
    
    func extratoCartao(_ ano: String, _ mes: String, _ completion: @escaping (inout [Lancamento]) -> Void){
        HttpGetService.init(servicePath: "lancamentos/" + "ano/\(ano)" + "/mes/\(mes)/extratocartao").invoke([Lancamento].self){cartoes in
            completion(&cartoes)
        }
    }

}
