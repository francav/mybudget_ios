//
//  user.swift
//  em3anos
//
//  Created by Victor Franca on 06/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class Usuario:Codable {
    
    //MARK: Properties
    let email: String
    let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
