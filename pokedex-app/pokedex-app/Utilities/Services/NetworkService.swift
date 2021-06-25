//
//  NetworkService.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit



class NetworkService: NSObject {
    let baseUrl = "https://pokeapi.co/api/v2"
    static let shared = NetworkService()
    
    //MARK: API Setup Methods
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
    
    public func executeFetchRequest(with urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        let session = getUrlSession()
        guard let urlRequest = setupGETUrlRequest(with: urlString) else {
            return
        }
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("\(String(describing: error?.localizedDescription))")
                completion(nil, error)
                return;
            }
            
            completion(data, nil)
        }
        dataTask.resume()
    }
    
    //MARK: Parse Data
    
    

}
