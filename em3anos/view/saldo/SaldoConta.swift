//
//  SaldoConta.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SaldoConta:DTO {
    
    private enum CodingKeys : String, CodingKey {
        case date, valor
    }
    
    //MARK: Properties
    
    var date: Date?;
    var valor: Double = 0
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        date = dateFormatter.date(from: try values.decode(String.self, forKey: .date))
        
        valor = try values.decode(Double.self, forKey: .valor)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(date, forKey: .date)
        try container.encode(valor, forKey: .valor)
    }
}
