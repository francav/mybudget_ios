//
//  ServicesFacade.swift
//  em3anos
//
//  Created by Victor Franca on 08/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class ServicesFacade{
    
    
    func login(_ usuario: Usuario,_ completion: @escaping (inout String) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 8080
        urlComponents.path = "/meussaldos-1.0-SNAPSHOT/services/auth/login"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // Make sure that we include headers specifying that our request's HTTP body
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        // Now let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(usuario)
            // ... and set our request's HTTP body
            request.httpBody = jsonData
        } catch {
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print(responseError!)
                return
            }
            
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, var utf8Representation = String(data: data, encoding: .utf8) {
                completion(&utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        
        task.resume()
    }
    
    func getContas(_ completion: @escaping (inout [ContaBanco]) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 8080
        urlComponents.path = "/meussaldos-1.0-SNAPSHOT/services/contasBancos"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // Make sure that we include headers specifying that our request's HTTP body
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"

        let token = UserDefaults.standard.string(forKey: "token")!
        headers["Authorization"] = "Bearer " + token

        request.allHTTPHeaderFields = headers
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print(responseError!)
                return
            }
            
            guard var contas = try? JSONDecoder().decode([ContaBanco].self, from: responseData!) else {
                print("Error: Couldn't decode data into Conta")
                Thread.callStackSymbols.forEach{print($0)}
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            completion(&contas)
        }
        
        task.resume()
        
    }
    
    func saveConta(conta: ContaBanco,_ completion: @escaping (inout String) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 8080
        urlComponents.path = "/meussaldos-1.0-SNAPSHOT/services/contasBancos/save"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // Make sure that we include headers specifying that our request's HTTP body
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"

        let token = UserDefaults.standard.string(forKey: "token")!
        headers["Authorization"] = "Bearer " + token

        request.allHTTPHeaderFields = headers
        
        // Now let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(conta)
            // ... and set our request's HTTP body
            request.httpBody = jsonData
        } catch {
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print(responseError!)
                return
            }
            
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, var utf8Representation = String(data: data, encoding: .utf8) {
                completion(&utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        
        task.resume()
    }
    
    func removeConta(conta: ContaBanco,_ completion: @escaping (inout String) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 8080
        urlComponents.path = "/meussaldos-1.0-SNAPSHOT/services/contasBancos/remove"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // Make sure that we include headers specifying that our request's HTTP body
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        
        let token = UserDefaults.standard.string(forKey: "token")!
        headers["Authorization"] = "Bearer " + token
        
        request.allHTTPHeaderFields = headers
        
        // Now let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(conta)
            // ... and set our request's HTTP body
            request.httpBody = jsonData
        } catch {
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print(responseError!)
                return
            }
            
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, var utf8Representation = String(data: data, encoding: .utf8) {
                completion(&utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        
        task.resume()
    }
    
    
}
