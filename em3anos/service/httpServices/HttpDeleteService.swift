//
//  DeleteService.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class HttpDeleteService: HttpService{
    
    init(servicePath : String){
        super.init(methodName: "DELETE", servicePath: servicePath)
    }
    
}
