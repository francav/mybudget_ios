//
//  GetService.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class HttpGetService: HttpService{
    
    init(servicePath : String){
        super.init(methodName: "GET", servicePath: servicePath)
    }
    
}
