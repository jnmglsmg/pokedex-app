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
    
    func loadGeneration(completion: @escaping(_ generationListViewModel: GenerationListViewModel?, _ error: Error?) -> Void) {
        let rootUrl = URL(string: "https://pokeapi.co/api/v2/generation/")
        let baseGeneration = Resource<GenerationList>(name: "Root URL", url: rootUrl!)
        
        NetworkService.shared.loadResource(resource: baseGeneration) { result in
            switch result {
            case .success(let generationList):
                //load Result: Resources
                //dispatch queue for each generationList.result
                //once finished then convert to view model
                completion(generationListViewModel, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
