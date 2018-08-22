//
//  Cartao.swift
//  em3anos
//
//  Created by Victor Franca on 21/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Cartao:Codable {
    
    //MARK: Properties
    var id: Int?
    var nome: String
    var diaFechamento: Int?
    var diaPagamento: Int?
    var contaPagamentoId: Int?
    
    init(nome: String) {
        self.nome = nome
    }
    
}
