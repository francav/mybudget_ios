//
//  OrcadoReal.swift
//  em3anos
//
//  Created by Victor Franca on 31/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class OrcadoReal: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case categoria, data, orcado, realizado
    }
    
    var categoria: String?
    
    var data: Date?
    
    var orcado: Double = 0.0
    var realizado: Double = 0.0
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        data = dateFormatter.date(from: try values.decode(String.self, forKey: .data))!
        
        categoria = try values.decode(String.self, forKey: .categoria)
        orcado = try values.decode(Double.self, forKey: .orcado)
        realizado = try values.decode(Double.self, forKey: .realizado)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(data, forKey: .data)
        try container.encode(categoria, forKey: .categoria)
        try container.encode(orcado, forKey: .orcado)
        try container.encode(realizado, forKey: .realizado)
    }
    
}

