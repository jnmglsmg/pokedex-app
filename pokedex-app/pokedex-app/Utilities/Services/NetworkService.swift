//
//  NetworkService.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit



class NetworkService: NSObject {
    static let baseUrl = "https://pokeapi.co/api/v2/"
    static let shared = NetworkService()
    
    func getUrlSession() -> URLSession  {
        let session = URLSession(configuration: .default)
        return session
    }
    
    func setupPOSTUrlRequest(with urlString: String) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        return request
    }
    
    func setupGETUrlRequest(with urlString: String) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
    
    public func executeFetchRequest(with urlString: String) -> Void {
        let session = getUrlSession()
        guard let urlRequest = setupGETUrlRequest(with: urlString) else {
            return
        }
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                return;
            }
            print("\(String(describing: data)) and \(String(describing: response))")
        }
        dataTask.resume()
    }
    
    //MARK: Parse Data

}
