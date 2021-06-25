//
//  GenerationListService.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/21/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class GenerationListService: NSObject {
    
    var generationList: [Generation]? = []
    
    fileprivate func getGenerationListData(completion: @escaping (_ result: GenerationList?, _ error: Error?) -> Void) {
        
        let urlString = "https://pokeapi.co/api/v2/generation/"
        NetworkService.shared.executeFetchRequest(with: urlString) { (data, error) in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            let parsedGenerationList = self.parseGenerationListData(data: data)
            completion(parsedGenerationList, nil)
        }
    }
    
    fileprivate func parseGenerationListData(data:Data) -> GenerationList? {
        let decoder = JSONDecoder()
        var generationListResult : GenerationList?
        do {
            let parsedGenerationList = try decoder.decode(GenerationList.self, from: data)
            generationListResult = parsedGenerationList
        }
        catch {
            print(error.localizedDescription)
        }
        
        return generationListResult
    }
    
    //MARK: Dummy
    
}
