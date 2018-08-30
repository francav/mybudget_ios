//
//  ServiceFacade.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class ServiceFacade{
    
    var servicePath: String
    
    init(servicePath: String){
        self.servicePath = servicePath
    }
    
    func login(usuario: Usuario, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: "auth/login").invoke(usuario){token in
            completion(&token)
        }
    }
    
    func save(dto: DTO, _ completion: @escaping (inout String) -> Void){
        HttpPostService.init(servicePath: servicePath).invoke(dto){token in
            completion(&token)
        }
    }
    
    func remove(uid: String, _ completion: @escaping (inout String) -> Void){
        HttpDeleteService.init(servicePath: servicePath + uid).invoke(uid){token in
            completion(&token)
        }
    }
    
    func find(_ completion: @escaping (inout String) -> Void){
        HttpGetService.init(servicePath: servicePath).invoke(){token in
            completion(&token)
        }
    }
    
}
