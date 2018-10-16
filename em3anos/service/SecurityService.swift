//
//  UsuarioFacade.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SecurityService{
    
    func login(usuario: Usuario, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "auth/login").invoke(usuario){token in
            completion(&token)
        }
    }
    
    func loginWithSavedData(_ completion: @escaping (inout String) -> Void){
        let usuario = Usuario()
        usuario.email = UserDefaults.standard.string(forKey: "email")!
        usuario.password = UserDefaults.standard.string(forKey: "password")!
        
        HttpPostService.init(servicePath: "auth/login").invoke(usuario){token in
            completion(&token)
        }
    }
}
