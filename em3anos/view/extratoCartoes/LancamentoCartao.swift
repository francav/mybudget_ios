//
//  LancamentoCartao.swift
//  em3anos
//
//  Created by Victor Franca on 14/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class LancamentoCartao: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case conta, categoria, dataCompra, status, comentario, qtdParcelas, indiceParcelas, valorCompra, valorParcela, saldo
    }
    
    var dataCompra: Date?
    
    var conta: String?
    
    var valorCompra: Double = 0.0
    var valorParcela: Double = 0.0
    var saldo: Double = 0.0
    
    var comentario: String?
    
    var categoria: String?
    
    var status: String?
    
    var qtdParcelas: Int?
    var indiceParcelas: Int?
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dataCompra = dateFormatter.date(from: try values.decode(String.self, forKey: .dataCompra))
        
        conta = try values.decode(String.self, forKey: .conta)
        valorCompra = try values.decode(Double.self, forKey: .valorCompra)
        valorParcela = try values.decode(Double.self, forKey: .valorParcela)
        saldo = try values.decode(Double.self, forKey: .saldo)
        comentario = try? values.decode(String.self, forKey: .comentario)
        categoria = try? values.decode(String.self, forKey: .categoria)
        status = try values.decode(String.self, forKey: .status)
        
        qtdParcelas = try values.decode(Int.self, forKey: .qtdParcelas)
        indiceParcelas = try values.decode(Int.self, forKey: .indiceParcelas)
        
        
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
//        var container = encoder.container(keyedBy: CodingKeys.self)
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let dataString = dateFormatter.string(from: dataCompra!)
//        try container.encode(dataString, forKey: .dataCompra)
//
//        try container.encode(conta, forKey: .conta)
//        try container.encode(valorCompra, forKey: .valorCompra)
//        //        try container.encode(saldo, forKey: .saldo)
//        try container.encode(comentario, forKey: .comentario)
//        //        try container.encode(contaOrigem, forKey: .contaOrigem)
//        try container.encode(contaDestino, forKey: .contaDestino)
//        try container.encode(categoria, forKey: .categoria)
//        try container.encode(ajuste, forKey: .ajuste)
//        //        try container.encode(saldoInicial, forKey: .saldoInicial)
//        //        try container.encode(cartaoCreditoFatura, forKey: .cartaoCreditoFatura)
//        try container.encode(tipo, forKey: .tipo)
//        try container.encode(status, forKey: .status)
//        try container.encode(parcelas, forKey: .parcelas)
        
    }
    
    
    
}
