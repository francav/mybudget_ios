//
//  Conta.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Conta: DTO{
    
    static let TIPO_BANCO = "0"
    static let TIPO_CARTAO = "1"
    static let TIPO_DINHEIRO = "2"
    
    private enum CodingKeys : String, CodingKey {
        case nome, tipo, saldoInicial, contaPagamentoId, contaPagamentoNome,  diaFechamento, diaPagamento
    }
    
    var nome: String = ""
    
    var tipo: String?
    
    var saldoInicial: Double?
    
    var contaPagamentoId: Int?
    var contaPagamentoNome: String?
    
    var diaFechamento: Int?
    var diaPagamento: Int?
    

    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nome = try values.decode(String.self, forKey: .nome)
        tipo = try values.decode(String.self, forKey: .tipo)
        saldoInicial = try? values.decode(Double.self, forKey: .saldoInicial)
        contaPagamentoId = try? values.decode(Int.self, forKey: .contaPagamentoId)
        contaPagamentoNome = try? values.decode(String.self, forKey: .contaPagamentoNome)
        diaFechamento = try? values.decode(Int.self, forKey: .diaFechamento)
        diaPagamento = try? values.decode(Int.self, forKey: .diaPagamento)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(nome, forKey: .nome)
        try container.encode(tipo, forKey: .tipo)
        try container.encode(saldoInicial, forKey: .saldoInicial)
        try container.encode(contaPagamentoId, forKey: .contaPagamentoId)
        try container.encode(contaPagamentoNome, forKey: .contaPagamentoNome)
        try container.encode(diaFechamento, forKey: .diaFechamento)
        try container.encode(diaPagamento, forKey: .diaPagamento)
    }
    
}
