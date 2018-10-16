//
//  UsuarioSignup.swift
//  em3anos
//
//  Created by Victor Franca on 09/10/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class UsuarioSignup: DTO{
    
    private enum CodingKeys : String, CodingKey {
        case nome, sobrenome, email, password
    }
    
    //MARK: Properties
    var nome: String? = ""
    var sobrenome: String? = ""
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
        nome = try values.decode(String.self, forKey: .nome)
        sobrenome = try values.decode(String.self, forKey: .sobrenome)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(nome, forKey: .nome)
        try container.encode(sobrenome, forKey: .sobrenome)
    }
    
    
}
