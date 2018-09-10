//
//  Lancamento.swift
//  em3anos
//
//  Created by Victor Franca on 24/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Lancamento: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case data, conta, valor, saldo, comentario, contaOrigem, contaDestino, categoria, ajuste, saldoInicial, cartaoCreditoFatura, tipo, status, parcelas
    }
    
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
    
    var tipo: String?
    
    var status: String?
    
    var parcelas: Int?
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        data = dateFormatter.date(from: try values.decode(String.self, forKey: .data))
        
        conta = try values.decode(String.self, forKey: .conta)
        valor = try values.decode(Double.self, forKey: .valor)
        saldo = try values.decode(Double.self, forKey: .saldo)
        comentario = try? values.decode(String.self, forKey: .comentario)
        contaOrigem = try? values.decode(String.self, forKey: .contaOrigem)
        contaDestino = try? values.decode(String.self, forKey: .contaDestino)
        categoria = try? values.decode(String.self, forKey: .categoria)
        ajuste = try values.decode(Bool.self, forKey: .ajuste)
        saldoInicial = try values.decode(Bool.self, forKey: .saldoInicial)
        cartaoCreditoFatura = try? values.decode(String.self, forKey: .cartaoCreditoFatura)
        status = try values.decode(String.self, forKey: .status)
        //parcelas = try values.decode(Int.self, forKey: .parcelas)
        
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dataString = dateFormatter.string(from: data!)
        try container.encode(dataString, forKey: .data)
        
        try container.encode(conta, forKey: .conta)
        try container.encode(valor, forKey: .valor)
//        try container.encode(saldo, forKey: .saldo)
        try container.encode(comentario, forKey: .comentario)
//        try container.encode(contaOrigem, forKey: .contaOrigem)
//        try container.encode(contaDestino, forKey: .contaDestino)
        try container.encode(categoria, forKey: .categoria)
//        try container.encode(ajuste, forKey: .ajuste)
//        try container.encode(saldoInicial, forKey: .saldoInicial)
//        try container.encode(cartaoCreditoFatura, forKey: .cartaoCreditoFatura)
        try container.encode(tipo, forKey: .tipo)
        try container.encode(status, forKey: .status)
        try container.encode(parcelas, forKey: .parcelas)
        
    }
    
    
    
}
