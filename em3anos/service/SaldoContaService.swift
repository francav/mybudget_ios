//
//  SaldoContaDTO.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SaldoContaService{
    
    func findCorrente(_ ano: String, _ mes: String, _ completion: @escaping (inout SaldoConta) -> Void){
        (HttpGetService).init(servicePath: "saldos/ano/\(ano)/mes/\(mes)/corrente/").invoke(SaldoConta.self){saldo in
            completion(&saldo)
        }
    }

    func findInicial(_ ano: String, _ mes: String, _ completion: @escaping (inout SaldoConta) -> Void){
        (HttpGetService).init(servicePath: "saldos/ano/\(ano)/mes/\(mes)/inicial/").invoke(SaldoConta.self){saldo in
            completion(&saldo)
        }
    }

    func findReceitaOrcada(_ ano: String, _ mes: String, _ completion: @escaping (inout SaldoConta) -> Void){
        (HttpGetService).init(servicePath: "saldos/ano/\(ano)/mes/\(mes)/orcado/receita/").invoke(SaldoConta.self){saldo in
            completion(&saldo)
        }
    }

    func findDespesaOrcada(_ ano: String, _ mes: String, _ completion: @escaping (inout SaldoConta) -> Void){
        (HttpGetService).init(servicePath: "saldos/ano/\(ano)/mes/\(mes)/orcado/despesa/").invoke(SaldoConta.self){saldo in
            completion(&saldo)
        }
    }

    func findPrevisto(_ ano: String, _ mes: String, _ completion: @escaping (inout SaldoConta) -> Void){
        (HttpGetService).init(servicePath: "saldos/ano/\(ano)/mes/\(mes)/previsto/").invoke(SaldoConta.self){saldo in
            completion(&saldo)
        }
    }

}
