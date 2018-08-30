//
//  UsuarioFacade.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class SecurityFacade{
    
    func login(usuario: Usuario, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "auth/login").invoke(usuario){token in
            completion(&token)
        }
    }
}
