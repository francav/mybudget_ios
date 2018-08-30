//
//  Cartao.swift
//  em3anos
//
//  Created by Victor Franca on 21/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Cartao: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case nome, diaFechamento, diaPagamento, contaPagamentoId
    }
    
    
    //MARK: Properties
    var nome: String = ""
    var diaFechamento: Int?
    var diaPagamento: Int?
    var contaPagamentoId: Int?
    
    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nome = try values.decode(String.self, forKey: .nome)
        diaFechamento = try values.decode(Int.self, forKey: .diaFechamento)
        diaPagamento = try values.decode(Int.self, forKey: .diaPagamento)
        contaPagamentoId = try values.decode(Int.self, forKey: .contaPagamentoId)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(nome, forKey: .nome)
        try container.encode(diaFechamento, forKey: .diaFechamento)
        try container.encode(diaPagamento, forKey: .diaPagamento)
        try container.encode(contaPagamentoId, forKey: .contaPagamentoId)
    }

    
    
}
