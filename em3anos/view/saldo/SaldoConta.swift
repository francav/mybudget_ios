//
//  SaldoConta.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SaldoConta:DTO {
    
    //MARK: Properties
    
    var ano: Int?
    var mes: Int?
    var valor: Double = 0
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}
