//
//  Categoria.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Categoria: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case nome, tipo
    }
    
    static let TIPO_RECEITA = "0"
    static let TIPO_DESPESA = "1"
    
    //MARK: Properties
    var nome: String = ""
    var tipo: String = ""
    
    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nome = try values.decode(String.self, forKey: .nome)
        tipo = try values.decode(String.self, forKey: .tipo)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(nome, forKey: .nome)
        try container.encode(tipo, forKey: .tipo)
    }
}
