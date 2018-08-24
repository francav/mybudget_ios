//
//  Lancamento.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Lancamento: Codable{
    
    var data: Date?
    
    var conta: String?
    
    var valor: Double
    var saldo: Double
    
    var comentario: String?

    var contaOrigem: String?
    var contaDestino: String?
    
    var categoria: String?

    var ajuste: Bool
    
    var saldoInicial: Bool

    var cartaoCreditoFatura: String?
    

    init(){
        self.valor = 0
        self.saldo = 0
        
        self.ajuste = false
        self.saldoInicial = false
    }
    
}
