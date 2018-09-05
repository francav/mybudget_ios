//
//  AnoMes.swift
//  em3anos
//
//  Created by Victor Franca on 05/09/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class AnoMes{
    
    var ano: Int
    var mes: Int
    var date: Date
    
    init(date: Date){
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        
        self.ano  = year
        self.mes = month
        self.date = date
    }
    
    func string() -> String{
        
        if(mes < 10){
            return String( "0\(mes)/\(ano)")
        }
        return String( "\(mes)/\(ano)")
    }
    
    
}
