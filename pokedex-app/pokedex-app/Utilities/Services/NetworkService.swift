//
//  NetworkService.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Resource<T: Decodable> : Decodable {
    let name: String
    let url: String
}

enum NetworkError : Error {
    case domainError
    case parseError
    case urlError
}

class NetworkService: NSObject {
    
   static let shared = NetworkService()
    
    func loadResource<T>(resource: Resource<T>, completion: @escaping(Result<T,NetworkError>) -> Void) {
         let urlString = resource.url 
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            
            if let result = result {
                completion(.success(result))
                return
            } else {
                completion(.failure(.parseError))
            }
        }.resume()
    }
    
    func loadData(with urlString: String, completion: @escaping(_ result: Data?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }.resume()
    }
}
