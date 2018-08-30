//
//  user.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Usuario:DTO{
    
    private enum CodingKeys : String, CodingKey {
        case email, password
    }
    
    //MARK: Properties
    var email: String = ""
    var password: String = ""
    
    override init(){
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
    }
 
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
    }

}
