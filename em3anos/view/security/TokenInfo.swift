//
//  TokenInfo.swift
//  em3anos
//
//  Created by Victor Franca on 04/10/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class TokenInfo{
    
    private enum CodingKeys : String, CodingKey {
        case exp
    }
    
    var exp: Date
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        exp = try values.decode(Date.self, forKey: .exp)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(exp, forKey: .exp)
    }
    
    
}
