//
//  ElMataarAPIClient.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 03/10/2021.
//

import Foundation

enum RequestVerb: String {
    case post = "POST"
    case get = "GET"
}

class ElMataarAPIClient: NSObject, URLSessionDelegate{
    let url = URL(string: "https://6159b114601e6f0017e5a2b6.mockapi.io/airlines")
    internal var urlSession : URLSession?
    

    static let shared = ElMataarAPIClient()
    internal override init() {
        super.init()
        urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
    }
    
    @discardableResult
    internal func launchJSONRequest<T:Decodable>(
        verb : RequestVerb,
        onSuccess : ((T) -> Void)?,
        onError : (() -> Void)?) -> URLSessionDataTask? {
        
        // create request
        guard let url = url else{
            onError?()
            return nil
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 30
        request.httpMethod = verb.rawValue;
        
        
        let task = urlSession?.dataTask(with: request) {(data, response, error) in
            
            if error != nil{
                DispatchQueue.main.async {
                    onError?()
                }
                return
            }
            
            DispatchQueue.main.async {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                
                
                if statusCode == 200 {
                    do {
                        if let data = data {
                    onSuccess?(try JSONDecoder().decode(T.self, from: data))
                        }
                        else {
                            onError?()
                        }
                    }
                    catch{
                        onError?()
                    }
                }
                else{
                    onError?()
                }
            }
        }
        
        task?.resume()
        return task;
    }
}
