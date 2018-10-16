//
//  SignupService.swift
//  em3anos
//
//  Created by Victor Franca on 09/10/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SignupService{
    
    func signup(usuario: UsuarioSignup, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "auth/signup").invoke(usuario){token in
            completion(&token)
        }
    }
    
}
