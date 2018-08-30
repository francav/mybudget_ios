//
//  Service.swift
//  em3anos
//
//  Created by Victor Franca on 30/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import Foundation

class HttpService{
    
    var urlComponents = URLComponents()
    let httpScheme = "http"
    let host = "localHost"
    let port = 8080
    let rootPath = "/meussaldos-1.0-SNAPSHOT/services/"
    var request : URLRequest?
    
    init(methodName: String, servicePath : String){
        
        urlComponents.scheme = httpScheme
        urlComponents.host = host
        urlComponents.port = port
        urlComponents.path = rootPath + servicePath
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        request = URLRequest(url: url)
        
        request!.httpMethod = methodName
        
        configHeader()
    }
    
    func invoke(_ completion: @escaping (inout String) -> Void) {
        invokeEndPoint(completion)
    }
    
    
    func invoke(_ dto: DTO,_ completion: @escaping (inout String) -> Void) {
        postEncode(dto)
        invokeEndPoint(completion)
    }
    
    private func configHeader() {
        var headers = request!.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request!.allHTTPHeaderFields = headers
    }
    
    internal func invokeEndPoint(_ completion: @escaping (inout String) -> Void) {
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request!) { (responseData, response, responseError) in
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
    
    private func postEncode(_ dto: DTO) {
        // Now let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(dto)
            // ... and set our request's HTTP body
            request!.httpBody = jsonData
        } catch let error as NSError {
            print("Error fetching user: \(error)")
            fatalError("erro ao converter jSON" + String(request.debugDescription))
        }
    }


}
