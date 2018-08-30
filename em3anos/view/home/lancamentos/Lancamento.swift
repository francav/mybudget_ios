//
//  Lancamento.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Lancamento{
    
    var data: Date?
    
    var conta: String?
    
    var valor: Double = 0.0
    var saldo: Double = 0.0
    
    var comentario: String?

    var contaOrigem: String?
    var contaDestino: String?
    
    var categoria: String?

    var ajuste: Bool = false
    
    var saldoInicial: Bool = false

    var cartaoCreditoFatura: String?
    
    
    
}
