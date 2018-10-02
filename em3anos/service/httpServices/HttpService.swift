//
//  HttpService.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class HttpService{
    
    var request: URLRequest
    
//    var httpScheme = "http"
//    var httpHost = "localhost"
//    var httpPort = 8080
//    var httpBasePath = "/meussaldos-1.0-SNAPSHOT/services/"

    var httpScheme = "https"
    var httpHost = "www.e3a.com.br"
    var httpPort : Int?
    var httpBasePath = "/e3a/services/"

    init(methodName: String, servicePath: String){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = httpScheme
        urlComponents.host = httpHost
        if(httpPort != nil){
            urlComponents.port = httpPort!
        }
//        urlComponents.port = httpPort
        urlComponents.path = httpBasePath + servicePath
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        // Specify this request as being a POST method
        request = URLRequest(url: url)
        request.httpMethod = methodName
        
        configHeader()
        
    }
    
    fileprivate func configHeader() {
        // Make sure that we include headers specifying that our request's HTTP body
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        
        let token = UserDefaults.standard.string(forKey: "token")
        
        if(token != nil){
            headers["Authorization"] = "Bearer " + token!
        }

        request.allHTTPHeaderFields = headers
    }
    
    fileprivate func encodeBodyData(_ dto: DTO) {
        // Now let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(dto)

            // ... and set our request's HTTP body
            request.httpBody = jsonData
        } catch {
            print("erro ao converter jSON" + String(request.debugDescription))
        }
    }
    
    fileprivate func invokeRequest(_ completion: @escaping (inout String) -> Void) {
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
    
    fileprivate func invokeRequest<T : Decodable>(_ type: T.Type, _ completion: @escaping (inout T) -> Void) {
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print(responseError!)
                return
            }
            guard var dtos = try? JSONDecoder().decode(type, from: responseData!) else {
                print(String(data: responseData!, encoding: .utf8)!)
                print("Error: Couldn't decode data into \(type)" )
                
//                Thread.callStackSymbols.forEach{print($0)}
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            completion(&dtos)
        }
        
        task.resume()
    }
    
    func invoke(_ dto: DTO,_ completion: @escaping (inout String) -> Void) {
        encodeBodyData(dto)
        
        invokeRequest(completion)
    }

    func invoke(_ id: String,_ completion: @escaping (inout String) -> Void) {
        invokeRequest(completion)
    }

    func invoke<T : Decodable>(_ type: T.Type, _ completion: @escaping (inout T) -> Void) {
        invokeRequest(type, completion)
    }

}
