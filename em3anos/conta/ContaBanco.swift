//
//  Conta.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation


class ContaBanco:Codable {
    
    //MARK: Properties
    var id: Int?
    var nome: String
    var saldoInicial: Double?
    
    init(nome: String, saldoInicial: Double) {
        self.nome = nome
        self.saldoInicial = saldoInicial
    }
    
}
