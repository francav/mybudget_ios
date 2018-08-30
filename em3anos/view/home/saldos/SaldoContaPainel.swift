//
//  SaldoConta.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SaldoContaPainel: DTO {
    
    private enum CodingKeys : String, CodingKey {
        case inicial, corrente, receitaOrcada, despesaOrcada, previsto
    }
    
    var inicial: Double = 0
    var corrente: Double = 0
    var receitaOrcada: Double = 0
    var despesaOrcada: Double = 0
    var previsto: Double = 0
    
    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        inicial = try values.decode(Double.self, forKey: .inicial)
        corrente = try values.decode(Double.self, forKey: .corrente)
        receitaOrcada = try values.decode(Double.self, forKey: .receitaOrcada)
        despesaOrcada = try values.decode(Double.self, forKey: .despesaOrcada)
        previsto = try values.decode(Double.self, forKey: .previsto)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(inicial, forKey: .inicial)
        try container.encode(corrente, forKey: .corrente)
        try container.encode(receitaOrcada, forKey: .receitaOrcada)
        try container.encode(despesaOrcada, forKey: .despesaOrcada)
        try container.encode(previsto, forKey: .previsto)
    }

    
    
}
