//
//  SaldoConta.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SaldoConta:Decodable {
    
    //MARK: Properties
    
    var ano: Int
    var mes: Int
    var valor: Double
    
    init(ano: Int, mes: Int, valor: Double) {
        self.ano = ano
        self.mes = mes
        self.valor = valor
    }
}
