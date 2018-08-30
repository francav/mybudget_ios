//
//  Service.swift
//  em3anos
//
//  Created by Victor Franca on 28/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class HttpPostService: HttpService{
    
    init(servicePath : String){
        super.init(methodName: "POST", servicePath: servicePath)
    }
    
}
