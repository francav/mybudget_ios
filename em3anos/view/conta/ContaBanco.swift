//
//  Conta.swift
//  em3anos
//
//  Created by Victor Franca on 07/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation


class ContaBanco: Conta {
    
    private enum CodingKeys : String, CodingKey {
        case saldoInicial
    }
    
    
    //MARK: Properties
    
    var saldoInicial: Double?
    
    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        saldoInicial = try values.decode(Double.self, forKey: .saldoInicial)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(saldoInicial, forKey: .saldoInicial)
    }
}
