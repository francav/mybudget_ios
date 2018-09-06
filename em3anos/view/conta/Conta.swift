//
//  Conta.swift
//  em3anos
//
//  Created by Victor Franca on 06/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Conta: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case nome
    }
    
    var nome: String = ""

    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nome = try values.decode(String.self, forKey: .nome)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(nome, forKey: .nome)
    }
    
}
